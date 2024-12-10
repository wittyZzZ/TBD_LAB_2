-- Conexion a la base de datos
\c tbd_lab_1

-- Primero creamos la función que ejecutará el trigger
CREATE OR REPLACE FUNCTION actualizar_estado_producto()
RETURNS TRIGGER AS $$
BEGIN
    -- Si el nuevo stock es 0, actualizamos el estado a 'Agotado'
    IF NEW.stock = 0 THEN
        NEW.estado = 'Agotado';
    -- Si el stock vuelve a ser mayor que 0, actualizamos el estado a 'Disponible'
    ELSIF NEW.stock > 0 AND OLD.estado = 'Agotado' THEN
        NEW.estado = 'Disponible';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Luego creamos el trigger
CREATE OR REPLACE TRIGGER trigger_actualizar_estado_producto
    BEFORE UPDATE OF stock
    ON PRODUCTO
    FOR EACH ROW
    EXECUTE FUNCTION actualizar_estado_producto();

--Creamos la función para el trigger de auditoría
CREATE OR REPLACE FUNCTION log_operations()
RETURNS TRIGGER AS $$
DECLARE
    data JSONB;
    usuario_actual VARCHAR(255);
BEGIN

    SELECT current_setting('myapp.current_user', true) INTO usuario_actual;

    IF TG_OP = 'INSERT' THEN
        data := row_to_json(NEW);
    ELSIF TG_OP = 'UPDATE' THEN
        data := jsonb_build_object('antes', row_to_json(OLD), 'despues', row_to_json(NEW));
    ELSIF TG_OP = 'DELETE' THEN
        data := row_to_json(OLD);
    END IF;

    INSERT INTO audit_log(tabla, operacion, datos, usuario)
    VALUES (TG_TABLE_NAME, TG_OP, data, usuario_actual);

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_log_operations
AFTER INSERT OR UPDATE OR DELETE ON PRODUCTO
FOR EACH ROW EXECUTE FUNCTION log_operations();

-- -- Se crea el trigger especifico para guardar en la tabla de auditoría cuando se cambia el precio de un producto
-- CREATE OR REPLACE TRIGGER trigger_actualizar_precio_producto
--     AFTER UPDATE OF precio
--     ON PRODUCTO
--     FOR EACH ROW
--     EXECUTE FUNCTION log_operations();

-- Se crea el trigger especifico para guardar en la tabla de auditoría cuando se cambia el precio de un producto
CREATE OR REPLACE TRIGGER trigger_actualizar_precio_producto
    AFTER UPDATE OF precio
    ON PRODUCTO
    FOR EACH ROW
    WHEN (OLD.precio IS DISTINCT FROM NEW.precio)
    EXECUTE FUNCTION log_operations();

--Procedimiento almacenado que entrega un reporte con los usuarios que más queries realizan
CREATE OR REPLACE PROCEDURE reporte_audit()
LANGUAGE plpgsql
AS $$
DECLARE
    record RECORD;
BEGIN
    CREATE TEMP TABLE temp_reporte_audit AS
    SELECT 
        usuario,
        COUNT(CASE WHEN operacion = 'INSERT' THEN 1 END) AS total_inserts,
        COUNT(CASE WHEN operacion = 'UPDATE' THEN 1 END) AS total_updates,
        COUNT(CASE WHEN operacion = 'DELETE' THEN 1 END) AS total_deletes,
        JSONB_AGG(JSONB_BUILD_OBJECT(
            'fecha', fecha,
            'operacion', operacion,
            'datos', datos
        )) AS detalle
    FROM 
        audit_log
    GROUP BY 
        usuario
    ORDER BY 
        (COUNT(CASE WHEN operacion = 'INSERT' THEN 1 END) + 
         COUNT(CASE WHEN operacion = 'UPDATE' THEN 1 END) + 
         COUNT(CASE WHEN operacion = 'DELETE' THEN 1 END)) DESC;

    FOR record IN SELECT * FROM temp_reporte_audit LOOP
        RAISE NOTICE E'\n============================';
        RAISE NOTICE 'Usuario: %', record.usuario;
        RAISE NOTICE 'Total Inserts: %', record.total_inserts;
        RAISE NOTICE 'Total Updates: %', record.total_updates;
        RAISE NOTICE 'Total Deletes: %', record.total_deletes;
        RAISE NOTICE 'Detalle: %', record.detalle;
        RAISE NOTICE E'============================\n';
    END LOOP;

    -- Eliminar la tabla temporal después de mostrar los resultados
    DROP TABLE IF EXISTS temp_reporte_audit;

END;
$$;


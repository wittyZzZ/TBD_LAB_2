package com.tbd_grupo_8.lab_1.repositories;

import com.tbd_grupo_8.lab_1.entities.Tienda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.ResultSetHandler;
import org.sql2o.Sql2o;

import java.awt.*;
import java.util.List;

@Repository
public class TiendaRepository {

    @Autowired
    private Sql2o sql2o;

    // Crear una nueva tienda
    public void create(Tienda tienda) {
        String sql = "INSERT INTO tienda (nombre, direccion, coordenadas, latitude, longitude) " +
                "VALUES (:nombre, :direccion, ST_SetSRID(ST_MakePoint(:longitud, :latitud), 4326), :latitud, :longitud)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("nombre", tienda.getNombre())
                    .addParameter("direccion", tienda.getDireccion())
                    .addParameter("latitud", tienda.getLatitude())
                    .addParameter("longitud", tienda.getLongitude())
                    .executeUpdate();
        }
    }

    // Obtener todas las tiendas
    public List<Tienda> getAll() {
        String sql = "SELECT id_tienda, nombre, direccion, ST_AsText(coordenadas) AS coordenadas, latitude, longitude FROM tienda";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch((ResultSetHandler<Tienda>) resultSet -> {
                        Tienda tienda = new Tienda();
                        tienda.setId_tienda(resultSet.getLong("id_tienda"));
                        tienda.setNombre(resultSet.getString("nombre"));
                        tienda.setDireccion(resultSet.getString("direccion"));
                        tienda.setCoordenadas(resultSet.getString("coordenadas"));
                        tienda.setLatitude(resultSet.getDouble("latitude"));
                        tienda.setLongitude(resultSet.getDouble("longitude"));
                        return tienda;
                    });
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener las tiendas", e);
        }
    }

    // Obtener una tienda por ID
    public Tienda getById(Long id) {
        String sql = "SELECT id_tienda, nombre, direccion, ST_AsText(coordenadas) AS coordenadas, latitude, longitude " +
                "FROM tienda WHERE id_tienda = :id";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetchFirst((ResultSetHandler<Tienda>) resultSet -> {
                        Tienda tienda = new Tienda();
                        tienda.setId_tienda(resultSet.getLong("id_tienda"));
                        tienda.setNombre(resultSet.getString("nombre"));
                        tienda.setDireccion(resultSet.getString("direccion"));
                        tienda.setCoordenadas(resultSet.getString("coordenadas"));
                        tienda.setLatitude(resultSet.getDouble("latitude"));
                        tienda.setLongitude(resultSet.getDouble("longitude"));
                        return tienda;
                    });
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener la tienda por ID", e);
        }
    }

    // Actualizar una tienda
    public void update(Tienda tienda) {
        String sql = "UPDATE tienda SET nombre = :nombre, direccion = :direccion, " +
                "coordenadas = ST_SetSRID(ST_MakePoint(:longitud, :latitud), 4326), " +
                "latitude = :latitud, longitude = :longitud WHERE id_tienda = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", tienda.getId_tienda())
                    .addParameter("nombre", tienda.getNombre())
                    .addParameter("direccion", tienda.getDireccion())
                    .addParameter("latitud", tienda.getLatitude())
                    .addParameter("longitud", tienda.getLongitude())
                    .executeUpdate();
        }
    }

    // Eliminar una tienda
    public void delete(Long id) {
        String sql = "DELETE FROM tienda WHERE id_tienda = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }


}

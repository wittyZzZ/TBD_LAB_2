package com.tbd_grupo_8.lab_1.repositories;

import com.tbd_grupo_8.lab_1.entities.Repartidor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.ResultSetHandler;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class RepartidorRepository {

    @Autowired
    private Sql2o sql2o;

    // Crear un nuevo repartidor
    public void create(Repartidor repartidor) {
        String sql = "INSERT INTO repartidor (nombre, coordenadas, latitude, longitude) " +
                "VALUES (:nombre, ST_SetSRID(ST_MakePoint(:longitud, :latitud), 4326), :latitud, :longitud)";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("nombre", repartidor.getNombre())
                    .addParameter("latitud", repartidor.getLatitude())
                    .addParameter("longitud", repartidor.getLongitude())
                    .executeUpdate();
        }
    }

    // Obtener todos los repartidores
    public List<Repartidor> getAll() {
        String sql = "SELECT id_repartidor, nombre, ST_AsText(coordenadas) AS coordenadas, latitude, longitude FROM repartidor";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch((ResultSetHandler<Repartidor>) resultSet -> {
                        Repartidor repartidor = new Repartidor();
                        repartidor.setId_repartidor(resultSet.getLong("id_repartidor"));
                        repartidor.setNombre(resultSet.getString("nombre"));
                        repartidor.setCoordenadas(resultSet.getString("coordenadas"));
                        repartidor.setLatitude(resultSet.getDouble("latitude"));
                        repartidor.setLongitude(resultSet.getDouble("longitude"));
                        return repartidor;
                    });
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener los repartidores", e);
        }
    }

    // Obtener un repartidor por ID
    public Repartidor getById(Long id) {
        String sql = "SELECT id_repartidor, nombre, ST_AsText(coordenadas) AS coordenadas, latitude, longitude " +
                "FROM repartidor WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetchFirst((ResultSetHandler<Repartidor>) resultSet -> {
                        Repartidor repartidor = new Repartidor();
                        repartidor.setId_repartidor(resultSet.getLong("id_repartidor"));
                        repartidor.setNombre(resultSet.getString("nombre"));
                        repartidor.setCoordenadas(resultSet.getString("coordenadas"));
                        repartidor.setLatitude(resultSet.getDouble("latitude"));
                        repartidor.setLongitude(resultSet.getDouble("longitude"));
                        return repartidor;
                    });
        } catch (Exception e) {
            throw new RuntimeException("Error al obtener el repartidor por ID", e);
        }
    }

    // Actualizar un repartidor
    public void update(Repartidor repartidor) {
        String sql = "UPDATE repartidor SET nombre = :nombre, " +
                "coordenadas = ST_SetSRID(ST_MakePoint(:longitud, :latitud), 4326), " +
                "latitude = :latitud, longitude = :longitud WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", repartidor.getId_repartidor())
                    .addParameter("nombre", repartidor.getNombre())
                    .addParameter("latitud", repartidor.getLatitude())
                    .addParameter("longitud", repartidor.getLongitude())
                    .executeUpdate();
        }
    }

    // Eliminar un repartidor
    public void delete(Long id) {
        String sql = "DELETE FROM repartidor WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
}

package com.tbd_grupo_8.lab_1.repositories;

import com.tbd_grupo_8.lab_1.entities.Repartidor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class RepartidorRepository {

    @Autowired
    private Sql2o sql2o;

    public void create(Repartidor repartidor) {
        String sql = "INSERT INTO repartidor (nombre, coordenadas) VALUES (:nombre, ST_SetSRID(ST_MakePoint(:lng, :lat), 4326))";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("nombre", repartidor.getNombre())
                    .addParameter("lng", repartidor.getCoordenadas().getX())
                    .addParameter("lat", repartidor.getCoordenadas().getY())
                    .executeUpdate();
        }
    }

    public List<Repartidor> getAll() {
        String sql = "SELECT id_repartidor, nombre, ST_AsText(coordenadas) AS coordenadas FROM repartidor";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .executeAndFetch(Repartidor.class);
        }
    }

    public Repartidor getById(Long id) {
        String sql = "SELECT id_repartidor, nombre, ST_AsText(coordenadas) AS coordenadas FROM repartidor WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            return con.createQuery(sql)
                    .addParameter("id", id)
                    .executeAndFetchFirst(Repartidor.class);
        }
    }

    public void update(Repartidor repartidor) {
        String sql = "UPDATE repartidor SET nombre = :nombre, coordenadas = ST_SetSRID(ST_MakePoint(:lng, :lat), 4326) WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", repartidor.getId_repartidor())
                    .addParameter("nombre", repartidor.getNombre())
                    .addParameter("lng", repartidor.getCoordenadas().getX())
                    .addParameter("lat", repartidor.getCoordenadas().getY())
                    .executeUpdate();
        }
    }

    public void delete(Long id) {
        String sql = "DELETE FROM repartidor WHERE id_repartidor = :id";
        try (Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
}

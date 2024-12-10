package com.tbd_grupo_8.lab_1.repositories;

import com.tbd_grupo_8.lab_1.entities.Orden;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class OrdenRepository {
    @Autowired
    private Sql2o sql2o;

    public List<Orden> findAll() {
        try (Connection conn = sql2o.open()) {
            return conn.createQuery("SELECT id_orden, fecha_orden, estado, id_cliente, total FROM orden")
                    .executeAndFetch(Orden.class);
        }
    }

    public Orden findById(long id) {
        try (Connection conn = sql2o.open()) {
            return conn.createQuery("SELECT id_orden, fecha_orden, estado, id_cliente, total" +
                            " FROM orden WHERE id_orden = :id")
                    .addParameter("id", id)
                    .executeAndFetchFirst(Orden.class);
        }
    }

    public Orden save(Orden orden) {
        String sql = "INSERT INTO orden (fecha_orden, estado, id_cliente, total) " +
                "VALUES (:fecha_orden, :estado, :id_cliente, :total) RETURNING id_orden";
        try (Connection conn = sql2o.open()) {
            Long id = (long) conn.createQuery(sql, true)
                    .addParameter("fecha_orden", orden.getFecha_orden())
                    .addParameter("estado", orden.getEstado())
                    .addParameter("id_cliente", orden.getId_cliente())
                    .addParameter("total", orden.getTotal())
                    .executeUpdate()
                    .getKey(Long.class);
            orden.setId_orden(id);
            return orden;
        }
    }

    public Orden update(Orden orden) {
        try (Connection conn = sql2o.open()) {
            String sql = "UPDATE orden SET " +
                    "fecha_orden = :fecha_orden," +
                    "estado = :estado," +
                    "id_cliente = :id_cliente," +
                    "total = :total" +
                    " WHERE id_orden = :id_orden";
            conn.createQuery(sql)
                .addParameter("fecha_orden", orden.getFecha_orden())
                .addParameter("estado", orden.getEstado())
                .addParameter("id_cliente", orden.getId_cliente())
                .addParameter("total", orden.getTotal())
                .executeUpdate();
            return orden;
        }
    }

    public boolean delete(long id) {
        try (Connection conn = sql2o.open()) {
            String sql = "DELETE FROM orden WHERE id_orden = :id_orden";
            conn.createQuery(sql)
                    .addParameter("id_orden", id)
                    .executeUpdate();
            return true;
        }
        catch (Exception e) {
            return false;
        }
    }
}

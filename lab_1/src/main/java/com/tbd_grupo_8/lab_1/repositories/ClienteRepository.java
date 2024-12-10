package com.tbd_grupo_8.lab_1.repositories;
import com.tbd_grupo_8.lab_1.entities.Cliente;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

@Repository
public class ClienteRepository {
    @Autowired
    private Sql2o sql2o;

    public List<Cliente> getAllClientes() {
        try(Connection connection = sql2o.open()){
            return connection
                    .createQuery("SELECT * FROM \"cliente\"")
                    .executeAndFetch(Cliente.class);
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public void createCliente(Cliente cliente) {
        String sql = "INSERT INTO \"cliente\" (username, direccion, email, contrasena, telefono, rol) VALUES (:username, :direccion, :email, :contrasena, :telefono, :rol)";
        try (org.sql2o.Connection con = sql2o.open()) {
            con.createQuery(sql)
                    .addParameter("username", cliente.getUsername())
                    .addParameter("direccion", cliente.getDireccion())
                    .addParameter("email", cliente.getEmail())
                    .addParameter("contrasena", cliente.getContrasena())
                    .addParameter("telefono", cliente.getTelefono())
                    .addParameter("rol", cliente.getRol())
                    .executeUpdate();
        }
    }

    public Cliente findByUsername(String username) {
        try(Connection connection = sql2o.open()){
            return connection
                    .createQuery("SELECT * FROM \"cliente\" WHERE username =:username")
                    .addParameter("username", username)
                    .executeAndFetch(Cliente.class).get(0);
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public Cliente findByEmail(String email) {
        try(Connection connection = sql2o.open()){
            return connection
                    .createQuery("SELECT * FROM \"cliente\" WHERE email =:email")
                    .addParameter("email", email)
                    .executeAndFetch(Cliente.class).get(0);
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    public String login(String username, String password) {
        return null;
    }

    public Cliente findByID(Long id) {
        try(Connection connection = sql2o.open()){
            return connection
                    .createQuery("SELECT * FROM \"cliente\" WHERE id_cliente =:id")
                    .addParameter("id_cliente", id)
                    .executeAndFetch(Cliente.class).get(0);
        }catch(Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }
}

package com.tbd_grupo_8.lab_1.controllers;


import com.tbd_grupo_8.lab_1.entities.Tienda;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.tbd_grupo_8.lab_1.services.TiendaService;

import java.util.List;

@RestController
@RequestMapping("/api/tienda")
public class TiendaController {

    @Autowired
    TiendaService tiendaService;

    // Endpoint para obtener todas las tiendas en formato JSON
    @GetMapping("/")
    public ResponseEntity<List<Tienda>> listTiendas() {
        List<Tienda> tiendas = tiendaService.getAll();
        return ResponseEntity.ok(tiendas);
    }

    // Endpoint para guardar una nueva tienda
    @PostMapping("/guardar")
    public ResponseEntity<Tienda> saveTienda(@RequestBody Tienda tienda) {
        tiendaService.create(tienda);
        return ResponseEntity.ok(tienda);
    }

    // Endpoint para actualizar una tienda
    @PutMapping("/actualizar")
    public ResponseEntity<Tienda> updateTienda(@RequestBody Tienda tienda) {
        tiendaService.update(tienda);
        return ResponseEntity.ok(tienda);
    }

    // Endpoint para obtener una tienda por ID
    @GetMapping("/{id}")
    public ResponseEntity<Tienda> getTienda(@PathVariable Long id) {
        Tienda tienda = tiendaService.getById(id);
        return ResponseEntity.ok(tienda);
    }

    // Endpoint para eliminar una tienda por ID
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTienda(@PathVariable Long id) {
        tiendaService.delete(id);
        return ResponseEntity.ok("Tienda eliminada");
    }

}

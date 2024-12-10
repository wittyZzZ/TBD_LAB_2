package com.tbd_grupo_8.lab_1.controllers;

import com.tbd_grupo_8.lab_1.dto.OrdenDto;
import com.tbd_grupo_8.lab_1.entities.Orden;
import com.tbd_grupo_8.lab_1.services.OrdenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;

@RestController
@RequestMapping("/api/orden")
public class OrdenController {
    @Autowired
    private OrdenService ordenService;

    @GetMapping("/")
    public ResponseEntity<List<Orden>> getAllOrdenes() {
        List<Orden> ordenes = ordenService.findAll();
        return new ResponseEntity<>(ordenes, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Orden> getOrdenById(@PathVariable long id) {
        Orden orden = ordenService.findById(id);
        if (orden != null) {
            return new ResponseEntity<>(orden, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @PostMapping("/crear")
    public ResponseEntity<Orden> createOrden(@RequestBody OrdenDto ordenDto) {
        try {
            Orden newOrden = new Orden();
            newOrden.setFecha_orden(LocalDateTime.now());
            newOrden.setEstado("Pagada"); // Encriptar la contraseña
            newOrden.setId_cliente(ordenDto.getId_cliente());
            newOrden.setTotal(ordenDto.getTotal());
            Orden saved = ordenService.save(newOrden);

            return new ResponseEntity<>(saved, HttpStatus.CREATED);
        }
        catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Orden> updateOrden(@PathVariable long id, @RequestBody Orden orden) {
        orden.setId_orden(id);
        Orden saved = ordenService.update(orden);
        if (saved != null) {
            return new ResponseEntity<>(saved, HttpStatus.OK);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Orden> deleteOrden(@PathVariable long id) {
        if (ordenService.delete(id)) {
            return new ResponseEntity<>(null, HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
    }
}

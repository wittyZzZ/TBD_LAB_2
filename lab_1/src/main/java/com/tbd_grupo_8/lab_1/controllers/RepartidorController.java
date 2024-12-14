package com.tbd_grupo_8.lab_1.controllers;

import com.tbd_grupo_8.lab_1.entities.Repartidor;
import com.tbd_grupo_8.lab_1.services.RepartidorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/repartidor")
public class RepartidorController {

    @Autowired
    RepartidorService repartidorService;

    @GetMapping("/")
    public List<Repartidor> listRepartidores() {
        return repartidorService.getAll();
    }
    @PostMapping("/")
    public Repartidor saveRepartidor(@RequestBody Repartidor repartidor) {
        repartidorService.create(repartidor);
        return repartidor;
    }

    @PutMapping("/")
    public Repartidor updateRepartidor(@RequestBody Repartidor repartidor) {
        repartidorService.update(repartidor);
        return repartidor;
    }

    @GetMapping("/{id}")
    public Repartidor getRepartidor(@PathVariable Long id) {
        return repartidorService.getById(id);
    }

    @DeleteMapping("/{id}")
    public String deleteRepartidor(@PathVariable Long id) {
        repartidorService.delete(id);
        return "Repartidor eliminado";
    }
}

package com.tbd_grupo_8.lab_1.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orden {
    private Long id_orden;
    private LocalDateTime fecha_orden;
    private String estado;
    private Long id_cliente;
    private Double total;
}

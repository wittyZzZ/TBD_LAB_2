package com.tbd_grupo_8.lab_1.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Data
@Getter
@Setter
public class OrderWithinDTO {
    private int idOrden;
    private LocalDateTime fechaOrden;
    private String estado;
    private double total;
    private int idCliente;
    private double distanciaKm;
}

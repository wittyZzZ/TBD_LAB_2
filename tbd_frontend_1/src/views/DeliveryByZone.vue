<template>

    <v-container class="mt-15">

        <div class="mt-5 text-h4 font-weight-bold">Repartidores con Envíos en Zona de Reparto</div>
        <v-divider class="mt-5"></v-divider>
        <Map class="mt-10" ref="map" />

        <v-row class="my-4 d-flex justify-start">
            <v-col cols="6" md="6">
                <!-- Selector de Zona de Reparto -->
                <v-select
                v-model="selectedZoneId"
                :items="zones"
                item-title="nombre"
                item-value="id_zona"
                label="Seleccionar zona de reparto"
                outlined
                />
            </v-col>
            
            <v-col cols="4" class="ml-15">
                <!-- Botón -->
                <v-btn
                color="primary"
                block
                size="large"
                @click="fetchDeliveriesInPolygon"
                >
                Mostrar ordenes en zona de reparto
                </v-btn>
            </v-col>
            <v-col cols="12" md="3">

                <v-table v-if="repartidores.length > 0">
                    <thead>
                    <tr>
                        <th class="text-left">
                        ID de Repartidor
                        </th>
                        <th class="text-left">
                        Nombre
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr
                        v-for="repartidor in repartidores"
                        :key="repartidor.id_repartidor"
                    >
                        <td>{{ repartidor.id_repartidor }}</td>
                        <td>{{ repartidor.nombre }}</td>

                    </tr>
                    </tbody>
                </v-table>
                
            </v-col>
        </v-row>
       
    </v-container>

</template>

<script>
import Map from "../components/Map.vue";
import tiendaService from "../services/tienda.service";

export default {
    components: {
        Map
    },

    data() {
        return {
            zones: [],
            repartidores: [],
            orders: [],
            clients: [],
            selectedZoneId: null,
            radius: 0
        }
    },

    methods: {
        // Obtiene la dirección del cliente correspondiente a la orden
        getOrderAddress(clientId) {
            const client = this.clients.find((c) => c.id_cliente === clientId);
            return client ? client.direccion : "Dirección no encontrada";
        },

        // Obtiene órdenes alrededor de la tienda seleccionada
        fetchDeliveriesInPolygon() {
            if (!this.selectedZoneId) {
                alert("Por favor, selecciona una zona de reparto.");
                return;
            }

            // Se obtienen los clientes que estan en la zona de reparto (necesario para obtener las coordenadas)

            // zoneService
            //     .getClientsInPolygon(this.selectedZoneId)
            //     .then((response) => {
            //     this.clients = response.data; // Asigna los clientes obtenidos
            //     })
            //     .catch((error) => {
            //     console.error("Error al obtener los clientes", error); // Maneja errores
            //     });

            // Se obtienen las ordenes entregadas en la zona de reparto (sólo las ordenes que tienen repartidor))

            // tiendaService
            //     .getOrdersInPolygon(this.selectedZoneId)
            //     .then((response) => {
            //     this.orders = response.data; // Asigna las órdenes obtenidas
            //     })
            //     .catch((error) => {
            //     console.error("Error al obtener las órdenes:", error); // Maneja errores
            //     });

            // Se obtienen los repartidores en la zona de reparto

            // tiendaService
            //     .getDeliveriesInPolygon(this.selectedZoneId)
            //     .then((response) => {
            //     this.repartidores = response.data; // Asigna los repartidores obtenidos
            //     })
            //     .catch((error) => {
            //     console.error("Error al obtener los repartidores:", error); // Maneja errores
            //     });

            // Encuentra la tienda seleccionada en el arreglo de tiendas
            const selectedZone = this.zones.find(
                (zone) => zone.id_zona === this.selectedZoneId
            );

            // Limpia los marcadores y circulos existentes en el mapa
            this.$refs.map.clearMarkers();
            this.$refs.map.circleGroup.clearLayers();
            this.$refs.map.polygonGroup.clearLayers(); // Limpia cualquier polígono existente

            // Dibuja el poligon
            this.$refs.map.putPolygon(
                selectedZone.poligono
            );

            // Centra el mapa en la zona seleccionada
            const [lat, lon] = selectedZone.poligono[0];
            this.$refs.map.map.setView([lat, lon], 14);


            // Marca las ubicaciones de las órdenes en el mapa
            this.orders.filter((order) => order.id_repartidor) // Solo procesa órdenes con repartidor asignado
                .forEach((order) => {
                    // Encuentra el cliente asociado a la orden por id_cliente
                    const client = this.clients.find((c) => c.id_cliente === order.id_cliente);

                    // Encuentra el repartidor asociado a la orden por id_repartidor
                    const repartidor = this.repartidores.find(
                        (r) => r.id_repartidor === order.id_repartidor
                    );

                    if (client && repartidor) {
                        // Construye el nombre para el marcador
                        const markerTitle = `Orden ${order.id_orden} entregada por ${repartidor.nombre}`;

                        // Marca la ubicación de la orden en el mapa usando las coordenadas del cliente
                        this.$refs.map.putMarker(
                            markerTitle,
                            client.latitude,
                            client.longitude,
                            "order" // Usa el ícono específico para las órdenes
                        );
                    }
                });
        },
    },

    mounted() {

        // // Se obtienen las zonas de reparto
        // zoneService.getAll()
        // .then(response => {
        //     this.zones = response.data; // Asignamos los datos de la respuesta
        // })
        // .catch(error => {
        //     console.error('Error al obtener las zonas de reparto:', error); // Manejamos errores
        // });

        // ZONAS DE REPARTO DE PRUEBA
        this.zones = [
            {
                id_zona: 1,
                nombre: "Zona Santiago Centro",
                poligono: [
                [-33.4500, -70.6500],
                [-33.4510, -70.6400],
                [-33.4600, -70.6400],
                [-33.4600, -70.6500],
                [-33.4500, -70.6500]
                ]
            },
            {
                id_zona: 2,
                nombre: "Zona Providencia",
                poligono: [
                [-33.4350, -70.6300],
                [-33.4370, -70.6200],
                [-33.4400, -70.6200],
                [-33.4400, -70.6300],
                [-33.4350, -70.6300]
                ]
            },
            {
                id_zona: 3,
                nombre: "Zona Las Condes",
                poligono: [
                [-33.4100, -70.5800],
                [-33.4150, -70.5700],
                [-33.4200, -70.5700],
                [-33.4200, -70.5800],
                [-33.4100, -70.5800]
                ]
            },
            {
                id_zona: 4,
                nombre: "Zona Ñuñoa",
                poligono: [
                [-33.4600, -70.6200],
                [-33.4650, -70.6100],
                [-33.4700, -70.6100],
                [-33.4700, -70.6200],
                [-33.4600, -70.6200]
                ]
            },
            {
                id_zona: 5,
                nombre: "Zona Maipú",
                poligono: [
                [-33.5000, -70.7600],
                [-33.5050, -70.7500],
                [-33.5100, -70.7500],
                [-33.5100, -70.7600],
                [-33.5000, -70.7600]
                ]
            },
            {
                id_zona: 6,
                nombre: "Zona Renca",
                poligono: [
                [-33.4000, -70.7300],
                [-33.4050, -70.7200],
                [-33.4100, -70.7200],
                [-33.4100, -70.7300],
                [-33.4000, -70.7300]
                ]
            },
            {
                id_zona: 7,
                nombre: "Zona Pudahuel",
                poligono: [
                [-33.4300, -70.8000],
                [-33.4350, -70.7900],
                [-33.4400, -70.7900],
                [-33.4400, -70.8000],
                [-33.4300, -70.8000]
                ]
            },
            {
                id_zona: 8,
                nombre: "Zona Independencia",
                poligono: [
                [-33.4100, -70.6600],
                [-33.4150, -70.6500],
                [-33.4200, -70.6500],
                [-33.4200, -70.6600],
                [-33.4100, -70.6600]
                ]
            },
            {
                id_zona: 9,
                nombre: "Zona La Florida",
                poligono: [
                [-33.5400, -70.5900],
                [-33.5450, -70.5800],
                [-33.5500, -70.5800],
                [-33.5500, -70.5900],
                [-33.5400, -70.5900]
                ]
            },
            {
                id_zona: 10,
                nombre: "Zona Peñalolén",
                poligono: [
                [-33.4900, -70.5500],
                [-33.4950, -70.5400],
                [-33.5000, -70.5400],
                [-33.5000, -70.5500],
                [-33.4900, -70.5500]
                ]
            }
        ];

        // CLIENTES DE ORDENES DE PRUEBA
        this.clients = [
            {
                id_cliente: 1,
                username: "Cliente 1",
                direccion: "Calle 1, Santiago Centro",
                email: "cliente1@gmail.com",
                contrasena: "pass1",
                telefono: "123456789",
                rol: "cliente",
                coordenadas: "POINT(-70.6450 -33.4550)",
                latitude: -33.4550,
                longitude: -70.6450
            },
            {
                id_cliente: 2,
                username: "Cliente 2",
                direccion: "Calle 2, Santiago Centro",
                email: "cliente2@gmail.com",
                contrasena: "pass2",
                telefono: "987654321",
                rol: "cliente",
                coordenadas: "POINT(-70.6410 -33.4520)",
                latitude: -33.4520,
                longitude: -70.6410
            },
            {
                id_cliente: 3,
                username: "Cliente 3",
                direccion: "Calle 3, Providencia",
                email: "cliente3@gmail.com",
                contrasena: "pass3",
                telefono: "123459876",
                rol: "cliente",
                coordenadas: "POINT(-70.6250 -33.4380)",
                latitude: -33.4380,
                longitude: -70.6250
            },
            {
                id_cliente: 4,
                username: "Cliente 4",
                direccion: "Calle 4, Providencia",
                email: "cliente4@gmail.com",
                contrasena: "pass4",
                telefono: "987651234",
                rol: "cliente",
                coordenadas: "POINT(-70.6280 -33.4360)",
                latitude: -33.4360,
                longitude: -70.6280
            },
            {
                id_cliente: 5,
                username: "Cliente 5",
                direccion: "Calle 5, Las Condes",
                email: "cliente5@gmail.com",
                contrasena: "pass5",
                telefono: "112233445",
                rol: "cliente",
                coordenadas: "POINT(-70.5750 -33.4150)",
                latitude: -33.4150,
                longitude: -70.5750
            },
            {
                id_cliente: 6,
                username: "Cliente 6",
                direccion: "Calle 6, Las Condes",
                email: "cliente6@gmail.com",
                contrasena: "pass6",
                telefono: "556677889",
                rol: "cliente",
                coordenadas: "POINT(-70.5780 -33.4180)",
                latitude: -33.4180,
                longitude: -70.5780
            },
            {
                id_cliente: 7,
                username: "Cliente 7",
                direccion: "Calle 7, Ñuñoa",
                email: "cliente7@gmail.com",
                contrasena: "pass7",
                telefono: "998877665",
                rol: "cliente",
                coordenadas: "POINT(-70.6150 -33.4630)",
                latitude: -33.4630,
                longitude: -70.6150
            },
            {
                id_cliente: 8,
                username: "Cliente 8",
                direccion: "Calle 8, Ñuñoa",
                email: "cliente8@gmail.com",
                contrasena: "pass8",
                telefono: "554433221",
                rol: "cliente",
                coordenadas: "POINT(-70.6180 -33.4660)",
                latitude: -33.4660,
                longitude: -70.4660
            },
            {
                id_cliente: 9,
                username: "Cliente 9",
                direccion: "Calle 9, Maipú",
                email: "cliente9@gmail.com",
                contrasena: "pass9",
                telefono: "667788990",
                rol: "cliente",
                coordenadas: "POINT(-70.7550 -33.5020)",
                latitude: -33.5020,
                longitude: -70.7550
            },
            {
                id_cliente: 10,
                username: "Cliente 10",
                direccion: "Calle 10, Maipú",
                email: "cliente10@gmail.com",
                contrasena: "pass10",
                telefono: "112211223",
                rol: "cliente",
                coordenadas: "POINT(-70.7570 -33.5070)",
                latitude: -33.5070,
                longitude: -70.7570
            }
        ];


        // ORDENES DE PRUEBA
        this.orders = [
            { id_orden: 1, fecha_orden: "2024-12-12T10:00:00", estado: "pendiente", id_cliente: 1, id_repartidor: 1, total: 50000 },
            { id_orden: 2, fecha_orden: "2024-12-12T11:00:00", estado: "completada", id_cliente: 2, id_repartidor: 2, total: 75000 },
            { id_orden: 3, fecha_orden: "2024-12-12T12:00:00", estado: "pendiente", id_cliente: 3, id_repartidor: 3, total: 40000 },
            { id_orden: 4, fecha_orden: "2024-12-12T13:00:00", estado: "completada", id_cliente: 4, id_repartidor: 4, total: 60000 },
            { id_orden: 6, fecha_orden: "2024-12-12T15:00:00", estado: "pendiente", id_cliente: 6, id_repartidor: 5, total: 80000 },
            { id_orden: 7, fecha_orden: "2024-12-12T16:00:00", estado: "completada", id_cliente: 7, id_repartidor: 6, total: 45000 },
            { id_orden: 8, fecha_orden: "2024-12-12T17:00:00", estado: "pendiente", id_cliente: 8, id_repartidor: 7, total: 70000 },
            { id_orden: 9, fecha_orden: "2024-12-12T18:00:00", estado: "completada", id_cliente: 9, id_repartidor: 8, total: 65000 },
            { id_orden: 11, fecha_orden: "2024-12-13T08:00:00", estado: "pendiente", id_cliente: 1, id_repartidor: 1, total: 30000 },
            { id_orden: 12, fecha_orden: "2024-12-13T09:30:00", estado: "completada", id_cliente: 2, id_repartidor: 2, total: 95000 },
            { id_orden: 13, fecha_orden: "2024-12-13T10:15:00", estado: "pendiente", id_cliente: 3, id_repartidor: 3, total: 45000 },
            { id_orden: 14, fecha_orden: "2024-12-13T11:45:00", estado: "completada", id_cliente: 4, id_repartidor: 4, total: 60000 },
            { id_orden: 15, fecha_orden: "2024-12-13T12:30:00", estado: "pendiente", id_cliente: 5, id_repartidor: 5, total: 75000 }
        ];

        this.repartidores = [
            { id_repartidor: 1, nombre: "Repartidor 1", coordenadas: "POINT(-70.6512 -33.4508)", latitude: -33.4508, longitude: -70.6512 },
            { id_repartidor: 2, nombre: "Repartidor 2", coordenadas: "POINT(-70.6487 -33.4493)", latitude: -33.4493, longitude: -70.6487 },
            { id_repartidor: 3, nombre: "Repartidor 3", coordenadas: "POINT(-70.3992 -23.6508)", latitude: -23.6508, longitude: -70.3992 },
            { id_repartidor: 4, nombre: "Repartidor 4", coordenadas: "POINT(-70.4017 -23.6492)", latitude: -23.6492, longitude: -70.4017 },
            { id_repartidor: 5, nombre: "Repartidor 5", coordenadas: "POINT(-73.0498 -36.8203)", latitude: -36.8203, longitude: -73.0498 },
            { id_repartidor: 6, nombre: "Repartidor 6", coordenadas: "POINT(-73.0512 -36.8217)", latitude: -36.8217, longitude: -73.0512 },
            { id_repartidor: 7, nombre: "Repartidor 7", coordenadas: "POINT(-70.9013 -29.9002)", latitude: -29.9002, longitude: -70.9013 },
            { id_repartidor: 8, nombre: "Repartidor 8", coordenadas: "POINT(-70.8997 -29.8998)", latitude: -29.8998, longitude: -70.8997 },
            { id_repartidor: 9, nombre: "Repartidor 9", coordenadas: "POINT(-71.6198 -33.0473)", latitude: -33.0473, longitude: -71.6198 },
            { id_repartidor: 10, nombre: "Repartidor 10", coordenadas: "POINT(-71.6215 -33.0488)", latitude: -33.0488, longitude: -71.6215 },
            { id_repartidor: 11, nombre: "Repartidor 11", coordenadas: "POINT(-70.6509 -33.4514)", latitude: -33.4514, longitude: -70.6509 },
            { id_repartidor: 12, nombre: "Repartidor 12", coordenadas: "POINT(-70.6493 -33.4497)", latitude: -33.4497, longitude: -70.6493 },
            { id_repartidor: 13, nombre: "Repartidor 13", coordenadas: "POINT(-70.3983 -23.6514)", latitude: -23.6514, longitude: -70.3983 },
            { id_repartidor: 14, nombre: "Repartidor 14", coordenadas: "POINT(-70.4008 -23.6483)", latitude: -23.6483, longitude: -70.4008 },
            { id_repartidor: 15, nombre: "Repartidor 15", coordenadas: "POINT(-71.6202 -33.0478)", latitude: -33.0478, longitude: -71.6202 }
        ];


    }
}
</script>

<style>

</style>
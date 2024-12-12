<template>

    <v-container class="mt-15">
        <Map class="mt-15" ref="map" />

        <v-row class="mt-4 d-flex justify-center">
            <v-col cols="12" md="6">
                <!-- Selector de Tienda -->
                <v-select
                v-model="selectedStoreId"
                :items="stores"
                item-title="nombre"
                item-value="id_tienda"
                label="Seleccionar tienda"
                outlined
                />
            </v-col>
            <v-col cols="12" md="6">
                <!-- Input para Radio -->
                <v-text-field
                v-model="radius"
                type="number"
                label="Radio en KM"
                outlined
                />
            </v-col>
            <v-col cols="4">
                <!-- Botón -->
                <v-btn
                color="primary"
                block
                size="large"
                @click="fetchOrdersAroundStore"
                >
                Mostrar órdenes alrededor de tienda
                </v-btn>
            </v-col>
        </v-row>
        <v-list>
            <v-list-item v-for="store in stores" :key="store.id_tienda">
                <v-list-item-content>
                <v-list-item-title>{{ store.nombre }}</v-list-item-title>
                
                    Dirección: {{ store.direccion }}<br />
                    Coordenadas: {{ store.latitude }}, {{ store.longitude }}<br />
                    WKT: {{ store.coordenadas }}
                
                </v-list-item-content>
            </v-list-item>
        </v-list>
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
            stores: [],
            orders: [],
            selectedStoreId: null,
            radius: 0
        }
    },

    methods: {
        // Obtiene órdenes alrededor de la tienda seleccionada
        fetchOrdersAroundStore() {
        if (!this.selectedStoreId || this.radius <= 0) {
            alert("Por favor, selecciona una tienda y un radio válido.");
            return;
        }

        // tiendaService
        //     .getClientsByOrdersAroundStore(this.selectedStoreId, this.radius)
        //     .then((response) => {
        //     this.orders = response.data; // Asigna las órdenes obtenidas
        //     })
        //     .catch((error) => {
        //     console.error("Error al obtener las órdenes:", error); // Maneja errores
        //     });

        // Encuentra la tienda seleccionada en el arreglo de tiendas
        const selectedStore = this.stores.find(
            (store) => store.id_tienda === this.selectedStoreId
        );

        // Limpia los marcadores y circulos existentes en el mapa
        this.$refs.map.clearMarkers();
        this.$refs.map.circleGroup.clearLayers();

        // Marca la tienda seleccionada en el mapa
        this.$refs.map.putMarker(
        selectedStore.nombre,
        selectedStore.latitude,
        selectedStore.longitude,
        "red"
        );

        // Centra el mapa en la tienda seleccionada y ajusta el zoom
        this.$refs.map.map.setView(
            [selectedStore.latitude, selectedStore.longitude],
            14 // Nivel de zoom (puedes ajustarlo según lo necesites)
        );

        // Dibuja el círculo alrededor de la tienda
        const radiusInMeters = this.radius * 1000; // Convierte el radio de KM a metros
        this.$refs.map.putCircle(
            selectedStore.latitude,
            selectedStore.longitude,
            radiusInMeters
        );

        // Marca las ubicaciones de los clientes en el mapa
        this.orders.forEach((order) => {
            this.$refs.map.putMarker(
            order.username,
            order.latitude,
            order.longitude,
            "grey" // Icono gris para los clientes
            );
        });
        },
    },

    mounted() {

        // // Se obtienen las tiendas
        // tiendaService.getAll()
        // .then(response => {
        //     this.stores = response.data; // Asignamos los datos de la respuesta
        // })
        // .catch(error => {
        //     console.error('Error al obtener las tiendas:', error); // Manejamos errores
        // });

        // TIENDAS DE PRUEBA
        this.stores = [
            {
                id_tienda: 1,
                nombre: "Tienda Central",
                direccion: "Av. Principal 123, Santiago",
                coordenadas: "POINT(-70.6500 -33.4500)",
                latitude: -33.4500,
                longitude: -70.6500,
            },
            {
                id_tienda: 2,
                nombre: "Tienda Norte",
                direccion: "Calle Norte 45, Antofagasta",
                coordenadas: "POINT(-70.4000 -23.6500)",
                latitude: -23.6500,
                longitude: -70.4000,
            },
            {
                id_tienda: 3,
                nombre: "Tienda Sur",
                direccion: "Camino del Sur 78, Concepción",
                coordenadas: "POINT(-73.0500 -36.8200)",
                latitude: -36.8200,
                longitude: -73.0500,
            },
            {
                id_tienda: 4,
                nombre: "Tienda Este",
                direccion: "Av. Oriente 91, La Serena",
                coordenadas: "POINT(-70.9000 -29.9000)",
                latitude: -29.9000,
                longitude: -70.9000,
            },
            {
                id_tienda: 5,
                nombre: "Tienda Oeste",
                direccion: "Calle Poniente 12, Valparaíso",
                coordenadas: "POINT(-71.6200 -33.0470)",
                latitude: -33.0470,
                longitude: -71.6200,
            },
            {
                id_tienda: 6,
                nombre: "Tienda Costanera",
                direccion: "Costanera 345, Santiago",
                coordenadas: "POINT(-70.6030 -33.4170)",
                latitude: -33.4170,
                longitude: -70.6030,
            },
            {
                id_tienda: 7,
                nombre: "Tienda Plaza Egaña",
                direccion: "Plaza Egaña 678, Ñuñoa",
                coordenadas: "POINT(-70.5890 -33.4520)",
                latitude: -33.4520,
                longitude: -70.5890,
            },
            {
                id_tienda: 8,
                nombre: "Tienda Alameda",
                direccion: "Av. Alameda 4321, Santiago",
                coordenadas: "POINT(-70.6700 -33.4560)",
                latitude: -33.4560,
                longitude: -70.6700,
            },
            {
                id_tienda: 9,
                nombre: "Tienda Viña",
                direccion: "Calle Quinta 56, Viña del Mar",
                coordenadas: "POINT(-71.5500 -33.0150)",
                latitude: -33.0150,
                longitude: -71.5500,
            },
            {
                id_tienda: 10,
                nombre: "Tienda Rancagua",
                direccion: "Calle Libertador 789, Rancagua",
                coordenadas: "POINT(-70.7400 -34.1700)",
                latitude: -34.1700,
                longitude: -70.7400,
            },
        ];

        // CLIENTES DE ORDENES DE PRUEBA
        this.orders = [
        { id_cliente: 1, username: "Cliente 1", latitude: -33.4510, longitude: -70.6510 },
        { id_cliente: 2, username: "Cliente 2", latitude: -33.4495, longitude: -70.6485 },
        { id_cliente: 3, username: "Cliente 3", latitude: -23.6505, longitude: -70.3995 },
        { id_cliente: 4, username: "Cliente 4", latitude: -23.6485, longitude: -70.4015 },
        { id_cliente: 5, username: "Cliente 5", latitude: -36.8190, longitude: -73.0490 },
        { id_cliente: 6, username: "Cliente 6", latitude: -36.8210, longitude: -73.0510 },
        { id_cliente: 7, username: "Cliente 7", latitude: -29.8990, longitude: -70.9010 },
        { id_cliente: 8, username: "Cliente 8", latitude: -29.9015, longitude: -70.8990 },
        { id_cliente: 9, username: "Cliente 9", latitude: -33.0465, longitude: -71.6195 },
        { id_cliente: 10, username: "Cliente 10", latitude: -33.0485, longitude: -71.6215 },
        { id_cliente: 11, username: "Cliente 11", latitude: -33.4512, longitude: -70.6505 },
        { id_cliente: 12, username: "Cliente 12", latitude: -33.4498, longitude: -70.6498 },
        { id_cliente: 13, username: "Cliente 13", latitude: -23.6510, longitude: -70.3985 },
        { id_cliente: 14, username: "Cliente 14", latitude: -23.6490, longitude: -70.4005 },
        { id_cliente: 15, username: "Cliente 15", latitude: -36.8195, longitude: -73.0485 },
        { id_cliente: 16, username: "Cliente 16", latitude: -36.8215, longitude: -73.0505 },
        { id_cliente: 17, username: "Cliente 17", latitude: -29.9005, longitude: -70.8995 },
        { id_cliente: 18, username: "Cliente 18", latitude: -29.8985, longitude: -70.9015 },
        { id_cliente: 19, username: "Cliente 19", latitude: -33.0475, longitude: -71.6205 },
        { id_cliente: 20, username: "Cliente 20", latitude: -33.0490, longitude: -71.6185 },
        ];

        
    }
}
</script>

<style>

</style>
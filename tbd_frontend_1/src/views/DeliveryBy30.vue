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
                <v-btn color="primary" block size="large" @click="fetchNearbyRepartidores">
                    Mostrar repartidores en radio
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
import Map from "../components/Map.vue";
import deliveryService from "@/services/delivery.service";

export default {
    components: { Map },
    data() {
        return {
            stores: [], // Lista de tiendas
            selectedStoreId: null, // Tienda seleccionada
            radius: 30, // Radio en kilómetros
            repartidores: [], // Repartidores obtenidos
             // Repartidores dentro del radio
            allRepartidores: [ // Repartidores de prueba
                { id_repartidor: 1, nombre: "Repartidor 1", latitude: -33.4510, longitude: -70.6510 },
                { id_repartidor: 2, nombre: "Repartidor 2", latitude: -33.4490, longitude: -70.6480 },
                { id_repartidor: 3, nombre: "Repartidor 3", latitude: -23.6490, longitude: -70.4010 },
                { id_repartidor: 4, nombre: "Repartidor 4", latitude: -23.6520, longitude: -70.3980 },
                { id_repartidor: 5, nombre: "Repartidor 5", latitude: -33.4600, longitude: -70.6600 }
            ]
        };
    },
    methods: {
        async fetchNearbyRepartidores() {
            if (!this.selectedStoreId || this.radius <= 0) {
                alert("Por favor, selecciona una tienda y un radio válido.");
                return;
            }

            // Encuentra la tienda seleccionada
            const selectedStore = this.stores.find(store => store.id_tienda === this.selectedStoreId);

            if (!selectedStore) {
                alert("Tienda no encontrada.");
                return;
            }
            this.$refs.map.clearMarkers();
            this.$refs.map.putCircle(selectedStore.latitude, selectedStore.longitude, this.radius * 1000);

            // Filtra repartidores cercanos
            const radiusInMeters = this.radius * 1000;
            this.repartidores = this.allRepartidores.filter(rep => {
                const distance = this.calculateDistance(
                    selectedStore.latitude,
                    selectedStore.longitude,
                    rep.latitude,
                    rep.longitude
                );
                return distance <= radiusInMeters; // Solo incluye los que están dentro del radio
            });

            // Marca los repartidores en el mapa
            this.repartidores.forEach(rep => {
                this.$refs.map.putMarker(rep.nombre, rep.latitude, rep.longitude, "grey");
            });

            /* try {
                // Llamada al backend para obtener repartidores cercanos
                const response = await axios.get("/api/repartidor/cercanos", {
                    params: {
                        lat: selectedStore.latitude,
                        lon: selectedStore.longitude,
                        radio: this.radius
                    }
                });

                // Limpia el mapa y agrega el círculo y los marcadores
                this.$refs.map.clearMarkers();
                this.$refs.map.putCircle(selectedStore.latitude, selectedStore.longitude, this.radius * 1000);

                // Muestra los repartidores obtenidos
                this.repartidores = response.data;
                this.repartidores.forEach(rep => {
                    this.$refs.map.putMarker(rep.nombre, rep.latitud, rep.longitud, "grey");
                });
            } catch (error) {
                console.error("Error al obtener repartidores:", error);
                alert("Error al obtener repartidores. Por favor, intenta nuevamente.");
            } */
        },
        calculateDistance(lat1, lon1, lat2, lon2) {
        const toRad = deg => (deg * Math.PI) / 180;
        const R = 6371e3; // Radio de la Tierra en metros
        const φ1 = toRad(lat1);
        const φ2 = toRad(lat2);
        const Δφ = toRad(lat2 - lat1);
        const Δλ = toRad(lon2 - lon1);

        const a =
            Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
            Math.cos(φ1) * Math.cos(φ2) * Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        return R * c; // Devuelve la distancia en metros
        }
    },
    mounted() {
        // Tiendas de prueba
        this.stores = [
            { id_tienda: 1, nombre: "Tienda Central", latitude: -33.4500, longitude: -70.6500 },
            { id_tienda: 2, nombre: "Tienda Norte", latitude: -23.6500, longitude: -70.4000 }
            // Agrega más tiendas aquí...
        ];
         // Repartidores dentro del radio
    }
};
</script>

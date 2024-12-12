<template>
    <div id="map" class="map-container"></div>
  </template>
  
  <script>
  import L from "leaflet";
  import "leaflet/dist/leaflet.css";
  import greypng from "../assets/marker-icon-2x-grey.png";
  import redpng from "../assets/marker-icon-2x-red.png";
  
  export default {
    name: "Map",
    data() {
      return {
        map: null, // Almacena la instancia del mapa Leaflet
        circleGroup: null, // Almacena el grupo de círculos
        markerGroup: null, // Almacena el grupo de marcadores
      };
    },
    mounted() {
      // Inicializa el mapa cuando el componente está montado
      this.map = L.map("map").setView([-33.45121494496883, -70.68451593558727], 7);
  
      // Agrega la capa base de OpenStreetMap
      L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution:
          '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      }).addTo(this.map);
  
      // Inicializa los grupos de capas para marcadores y círculos
      this.circleGroup = L.layerGroup().addTo(this.map);
      this.markerGroup = L.layerGroup().addTo(this.map);
    },
    methods: {
      // Agrega un marcador al mapa
      putMarker(name, lat, lon, icon = null) {
        let marker;
        switch (icon) {
          case "grey":
            const grayIcon = new L.Icon({
              iconUrl: greypng,
              shadowUrl:
                "https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png",
              iconSize: [25, 41],
              iconAnchor: [12, 41],
              popupAnchor: [1, -34],
              shadowSize: [41, 41],
            });
            marker = L.marker([lat, lon], { title: name, icon: grayIcon });
            break;
          case "red":
            const redIcon = new L.Icon({
              iconUrl: redpng,
              shadowUrl:
                "https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png",
              iconSize: [25, 41],
              iconAnchor: [12, 41],
              popupAnchor: [1, -34],
              shadowSize: [41, 41],
            });
            marker = L.marker([lat, lon], { title: name, icon: redIcon });
            break;
          default:
            marker = L.marker([lat, lon], { title: name });
        }
        this.markerGroup.addLayer(marker); // Agrega el marcador al grupo
      },
  
      // Limpia todos los marcadores del mapa
      clearMarkers() {
        this.markerGroup.clearLayers();
      },
  
      // Dibuja un círculo en el mapa
      putCircle(lat, lon, rad) {
        this.circleGroup.clearLayers(); // Limpia cualquier círculo existente
        const circle = L.circle([lat, lon], { radius: rad }); // Crea un nuevo círculo
        this.circleGroup.addLayer(circle); // Agrega el círculo al grupo
      },
    },
  };
  </script>
  
  <style scoped>
  .map-container {
    width: 100%;
    height: 700px;
  }
  </style>
  
  
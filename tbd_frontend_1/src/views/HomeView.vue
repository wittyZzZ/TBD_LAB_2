<script>

import { jwtDecode } from 'jwt-decode';
import clienteService from '../services/cliente.service';

export default{
  inject: ["logout"],
  name: 'Home',
  data() {
    return{
      users: []
    }
  },
  methods: {
  },
  mounted() {

    // clienteService.getAll()
    //   .then(response => {
    //     this.users = response.data; // Asignamos los datos de la respuesta
    //   })
    //   .catch(error => {
    //     console.error('Error al obtener los usuarios:', error); // Manejamos errores
    //   });
  }
}
</script>

<template>
  
  <v-container class="home-container" fluid>
    <v-row justify="center">
      <v-card class="text-center pa-6" elevation="8" max-width="400">
        <v-card-title class="text-h5">Bienvenido</v-card-title>
        <p>Ve a la pestaña "Productos" para empezar tu compra</p>

      </v-card>

      <!-- <v-col cols="4" class="bg-purple text-center">
        <v-btn color="primary" :to="{ name: 'Products' }">
          LINK A PRODUCTOS
        </v-btn>
      </v-col> -->

    </v-row>
  </v-container>
</template>

<style scoped>
  .home-container {
    height: 100vh;
    display: flex;
    align-items: center;
    background-image: url('../assets/fondoapp_2.jpg');
    background-size: cover;
    background-position: center; 
    background-repeat: no-repeat;
  }
</style>



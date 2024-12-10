<template>
    <v-navigation-drawer :value="drawer" @input="$emit('update:drawer', $event)" app temporary>
      <v-list>
        <v-item-group>
          <v-list-item v-for="item in menuItems" :key="item.text" :to="item.route">
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-title>
              {{ item.text }}
            </v-list-item-title>
          </v-list-item>
        </v-item-group>
      </v-list>
    </v-navigation-drawer>
</template>
  
  <script>
  export default {
    props: ['drawer'],
    data() {
      return {
        menuItems: [
          { text: "Inicio", icon: "mdi-home", route: "/" },
          { text: "Productos", icon: "mdi-package-variant", route: "/products" },
          { text: "Categorias", icon: "mdi-checkbox-multiple-blank", route: ""},
          { text: "Perfil", icon: "mdi-account", route: "/client" },
          // Agrega más opciones de menú según tus necesidades
        ],
      };
    },
  };
  </script>
  
<!--   <style scoped>
  /* Opcional: personaliza el estilo del menú lateral aquí */
  </style> -->
  
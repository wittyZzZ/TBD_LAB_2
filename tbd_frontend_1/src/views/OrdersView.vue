<template>
    <v-container>
      <v-card>
        <v-card-title>Gestión de Órdenes</v-card-title>
        <v-card-subtitle>Visualiza, crea y edita órdenes</v-card-subtitle>
        
        <!-- Tabla de órdenes -->
        <v-data-table
          :items="ordenes"
          :headers="headers"
          item-value="id_orden"
          class="elevation-1"
          dense
        >
          <template #top>
            <v-toolbar flat>
              <v-toolbar-title>Órdenes</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-btn @click="openDialog()" color="primary">Nueva Orden</v-btn>
            </v-toolbar>
          </template>
          <template #item.acciones="{ item }">
            <v-btn @click="editOrden(item)" icon color="blue">
              <v-icon>mdi-pencil</v-icon>
            </v-btn>
            <v-btn @click="deleteOrden(item)" icon color="red">
              <v-icon>mdi-delete</v-icon>
            </v-btn>
          </template>
        </v-data-table>
      </v-card>
  
      <!-- Diálogo para formulario -->
      <v-dialog v-model="dialog" max-width="500px">
        <v-card>
          <v-card-title>
            <span class="text-h6">{{ formTitle }}</span>
          </v-card-title>
          <v-card-text>
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="form.id_orden"
                label="ID Orden"
                type="number"
                readonly
                v-if="form.id_orden"
              ></v-text-field>
              <v-text-field
                v-model="form.id_cliente"
                label="ID Cliente"
                type="number"
                required
              ></v-text-field>
              <v-menu
                v-model="datePicker"
                :close-on-content-click="false"
                transition="scale-transition"
                offset-y
                min-width="290px"
              >
                <template #activator="{ props }">
                  <v-text-field
                    v-model="form.fecha_orden"
                    label="Fecha de Orden"
                    readonly
                    v-bind="props"
                  ></v-text-field>
                </template>
                <v-date-picker
                  v-model="form.fecha_orden"
                  no-title
                  scrollable
                ></v-date-picker>
              </v-menu>
              <v-select
                v-model="form.estado"
                :items="['Pendiente', 'Procesando', 'Completada', 'Cancelada']"
                label="Estado"
                required
              ></v-select>
              <v-text-field
                v-model="form.total"
                label="Total"
                type="number"
                step="0.01"
                required
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn text color="red" @click="closeDialog()">Cancelar</v-btn>
            <v-btn text color="green" @click="saveOrden()">Guardar</v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
    </v-container>
  </template>
  
  <script>
  import ordenService from '@/services/orden.service';

  export default {
    data() {
      return {
        //ordenes: [],
        /*headers: [
            { text: "ID Orden", value: "id_orden" },
            { text: "Fecha", value: "fecha_orden" },
            { text: "Estado", value: "estado" },
            { text: "ID Cliente", value: "id_cliente" },
            { text: "Total", value: "total" },
            { text: "Acciones", value: "acciones", sortable: false },
        ] */
        ordenes: [
          { id_orden: 1, fecha_orden: "2024-12-10", estado: "Pendiente", id_cliente: 101, total: 1200.5 },
          { id_orden: 2, fecha_orden: "2024-12-11", estado: "Completada", id_cliente: 102, total: 800.0 },
        ],
        headers: [
          { text: "ID Orden", value: "id_orden" },
          { text: "Fecha", value: "fecha_orden" },
          { text: "Estado", value: "estado" },
          { text: "ID Cliente", value: "id_cliente" },
          { text: "Total", value: "total" },
          { text: "Acciones", value: "acciones", sortable: false },
        ],
        dialog: false,
        form: {
          id_orden: null,
          fecha_orden: null,
          estado: "",
          id_cliente: null,
          total: null,
        },
        formTitle: "",
        valid: false,
        datePicker: false,
      };
    },
    /*created() {
      this.fetchOrdenes();
    }, */
    /* 
    methods: {
      async fetchOrdenes() {
        try {
          const response = await ordenService.getAll();
          this.ordenes = response.data;
        } catch (error) {
          console.error("Error al obtener las órdenes:", error);
        }
      },
      openDialog() {
        this.form = {
          id_orden: null,
          fecha_orden: null,
          estado: "",
          id_cliente: null,
          total: null,
        };
        this.formTitle = "Nueva Orden";
        this.dialog = true;
      },
      editOrden(item) {
        this.form = { ...item };
        this.formTitle = "Editar Orden";
        this.dialog = true;
      },
      async saveOrden() {
        if (!this.$refs.form.validate()) return;
  
        try {
          if (this.form.id_orden) {
            // Actualizar orden existente
            await ordenService.update(this.form.id_orden, this.form);
          } else {
            // Crear nueva orden
            await ordenService.create(this.form);
          }
          this.fetchOrdenes(); // Refrescar la lista
          this.closeDialog();
        } catch (error) {
          console.error("Error al guardar la orden:", error);
        }
      },
      async deleteOrden(item) {
        try {
          await ordenService.remove(item.id_orden);
          this.fetchOrdenes(); // Refrescar la lista
        } catch (error) {
          console.error("Error al eliminar la orden:", error);
        }
      },
      closeDialog() {
        this.dialog = false;
      },
    },
    */
    methods: {
      openDialog() {
        this.form = {
          id_orden: null,
          fecha_orden: null,
          estado: "",
          id_cliente: null,
          total: null,
        };
        this.formTitle = "Nueva Orden";
        this.dialog = true;
      },
      editOrden(item) {
        this.form = { ...item };
        this.formTitle = "Editar Orden";
        this.dialog = true;
      },
      saveOrden() {
        if (!this.$refs.form.validate()) return;
  
        if (this.form.id_orden) {
          const index = this.ordenes.findIndex(o => o.id_orden === this.form.id_orden);
          if (index !== -1) this.ordenes.splice(index, 1, { ...this.form });
        } else {
          this.form.id_orden = this.ordenes.length + 1;
          this.ordenes.push({ ...this.form });
        }
        this.closeDialog();
      },
      deleteOrden(item) {
        this.ordenes = this.ordenes.filter(o => o.id_orden !== item.id_orden);
      },
      closeDialog() {
        this.dialog = false;
      },
    },
  };
  </script>
  
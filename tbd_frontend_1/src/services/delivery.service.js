import httpClient from "../http-common";

const getAll = () => {
  return httpClient.get("/api/repartidor/");
};

const getById = (id) => {
  return httpClient.get(`/api/repartidor/${id}`);
};

const create = (repartidor) => {
  return httpClient.post("/api/repartidor/guardar", repartidor);
};

const update = (repartidor) => {
  return httpClient.put("/api/repartidor/actualizar", repartidor);
};

const remove = (id) => {
  return httpClient.delete(`/api/repartidor/${id}`);
};

export default { getAll, getById, create, update, remove };
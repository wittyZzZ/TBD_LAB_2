import httpClient from "../http-common"

const getAll = () => {
  return httpClient.get('/api/orden/');
};

const getById = id => {
  return httpClient.get(`/api/orden/${id}`);
};

const create = (orden) => {
    return httpClient.post('/api/orden/crear', orden);
  };

const update = (id, orden) => {
  return httpClient.put(`/api/orden/${id}`, orden);
};
  
const remove = (id) => {
  return httpClient.delete(`/api/orden/${id}`);
};

export default { getAll, getById, create, update, remove };
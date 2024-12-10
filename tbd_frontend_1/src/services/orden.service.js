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


export default { getAll, getById, create };
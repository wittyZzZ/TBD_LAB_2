import httpClient from "../http-common"

const getAll = () => {
  return httpClient.get('/api/cliente/');
};

export default { getAll };





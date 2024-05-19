import axios from 'axios';

const API_URL = process.env.REACT_APP_BACKEND_SERVICE;
//const url = API_URL

const url = `http://${API_URL}`
export default axios.create({
    baseURL: url,
    headers: {
        "Content-type": "application/json",
      },
});
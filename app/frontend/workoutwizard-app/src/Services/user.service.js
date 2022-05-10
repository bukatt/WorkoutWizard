import axios from "axios";
import WOWEndpoints from '../Endpoints/WowBackend';

export const loginAPI = ({userName, password}) => {
    return axios
      .post(WOWEndpoints.login, {
        userName,
        password,
      })
      .then((response) => {
        console.log(response)
        return response.data;
      });
  };
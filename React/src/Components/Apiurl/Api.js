import axios from 'axios';

// Define the BASE_URL
export const BASE_URL = 'https://23.23.27.157';

// Create and configure Axios instance
export const axiosInstance = axios.create({
  baseURL: BASE_URL,
  httpsAgent: new (require('https').Agent)({
    rejectUnauthorized: false, // Disable SSL verification (development only)
  }),
});

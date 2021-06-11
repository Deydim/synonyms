const { createServer } = require('http');
const axios = require('axios');
const { URL } = require('url');
const { lookupRequest } = require('./lookup');

const host = '0.0.0.0';
const port = process.env.PORT;
// const port = 8000;
// const host = "localhost";

const requestListener = async (request, response) => {
  response.setHeader('Access-Control-Allow-Origin', '*');
  response.setHeader('Access-Control-Request-Method', '*');
  response.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET');
  response.setHeader('Access-Control-Allow-Headers', '*');
  response.setHeader('Content-Type', 'application/json; charset=utf-8');
  response.writeHead(200);
  const url = new URL ("http://" + request.headers.host + request.url);
  const options = ['word', 'from', 'to'].map(element => url.searchParams.get(element));
  response.end( 
    await axios(lookupRequest(options))
    .then(obj => JSON.stringify(obj.data, null, 4))
    .catch(err=>err.toString())
  );
};

createServer(requestListener)
  .listen(port, host, () => console.log(`Server is running on http://${host}:${port}`));

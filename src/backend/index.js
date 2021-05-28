const http = require('http');
const { lookup } = require('./lookup.js');
const axios = require('axios');
const { URL } = require('url');

const host = '0.0.0.0';
// const host = "localhost";
// const port = 8000;
const port = process.env.PORT;

const queryTransAPI = async function (word, from, to) {
  const requestData = lookup(word, from, to);
  return (
    await axios(requestData)
      .then(JSONStringify)
      .catch(err=>err.toString())
  )
}

const JSONStringify = obj => JSON.stringify(obj.data, null, 4);

const requestListener = async function (request, response) {
  const url = new URL ("http://" +request.headers.host + request.url);
  const word = url.searchParams.get('word');
  const from = url.searchParams.get('from');
  const to = url.searchParams.get('to');

  
  const result = word && from && to ? await queryTransAPI(word, from, to) : "Bad params in your GET request.";
  
  response.setHeader('Access-Control-Allow-Origin', '*');
	response.setHeader('Access-Control-Request-Method', '*');
	response.setHeader('Access-Control-Allow-Methods', 'OPTIONS, GET');
	response.setHeader('Access-Control-Allow-Headers', '*');
  response.setHeader('Content-Type', 'application/json; charset=utf-8');
  response.writeHead(200);
  response.end(result);
};

const server = http.createServer(requestListener);

const serverListensAction = () => {
  console.log(`Server is running on http://${host}:${port}`);
};

server.listen(port, host, serverListensAction);

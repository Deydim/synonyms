const crypto = require("crypto");
exports.lookupRequest = ([word, from, to]) => { 
  return {
    baseURL: 'https://api.cognitive.microsofttranslator.com/',
    url: 'dictionary/lookup',
    method: 'POST',
    headers: {
      'Ocp-Apim-Subscription-Region': 'westeurope',
      'Ocp-Apim-Subscription-Key': 'MY-KEY',
      'Content-type': 'application/json',
      'X-ClientTraceId': crypto.randomBytes(16).toString("hex")
    },
    params: {
      'api-version': '3.0',
      'from': from,
      'to': to
    },
    data: [{'text': word}]
  }
}

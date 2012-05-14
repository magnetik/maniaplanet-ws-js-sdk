class HTTPClient
  @apiURL: 'https://ws.maniaplanet.com'
  
  constructor: (@username, @password) ->
  
  execute: (method, ressource) ->
    url = @apiURL + method
    
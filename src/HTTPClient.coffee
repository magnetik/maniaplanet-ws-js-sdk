https     = require 'https'
url       = require 'url'

class HTTPClient
  @apiURL: 'https://ws.maniaplanet.com'
  
  constructor: (@username, @password) ->
  
  execute: (method, ressource) ->
    ressourceURL = url.parse(@apiURL + ressource)
    options =
      'method': method
      'auth': @username + ':' + @password
      'headers':
        'Content-type': 'application/json'
      
    Array::push.apply options, ressourceURL         #Merge the two arrays
    
    # Execute request
    https.get options, (res) ->
      data = ''
      res.on 'data', (chunk) ->
        data += chunk.toString()
      res.on 'end', () ->
        data
        
        
      
      
    
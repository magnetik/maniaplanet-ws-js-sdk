jQuery = require('jquery')
$ = jQuery

class HTTPClient
  constructor: (@username, @password) ->
    @apiURL = 'https://ws.maniaplanet.com/'
    throw new SyntaxError('Please specify an username and a password') if not @username? or not @password?
    
  
  execute: (method, ressource, callback) ->
    url = @apiURL + ressource + '/'
    $.ajax url,
      type:         method
      dataType:     'jsonp'
      jsonp:        'jsonp_callback'
      username:     @username
      password:     @password
      xhrFields: 
        withCredentials: true
      error: (jqXHR, textStatus, errorThrown) ->
        callback jqXHR textStatus errorThrown
      success: (data, textStatus, jqXHR) ->
        callback(data, textStatus, jqXHR)
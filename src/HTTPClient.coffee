$ = jQuery

class HTTPClient
  constructor: (@username, @password) ->
    @apiURL = 'https://ws.maniaplanet.com/'
    throw new SyntaxError('Please specify an username and a password') if not @username? or not @password?
    
  
  execute: (method, ressource) ->
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
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        $('body').append "Successful AJAX call: #{data}"
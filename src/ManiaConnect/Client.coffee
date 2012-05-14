class Client
  @baseUrl:               'https://ws.maniaplanet.com/'
  @tokenUrl:              "#{@baseUrl}/oauth2/token/"
  @authorizeUrl:          "#{@baseUrl}/oauth2/authorize/"  
  
  getAuthorizationURL: ->
    
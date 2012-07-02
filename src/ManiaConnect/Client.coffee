class Client
  constructor: (@clientId) ->
    @tokenUrl = 'http://127.0.0.1/oauth2/index.php/authorize/?'

  login: (scope, redirectUrl) ->
    data = $.param
      response_type: 'token'
      client_id: @clientId
      redirect_uri: encodeURI redirectUrl
      scope: encodeURI scope

    url = @tokenUrl + data

    win = window.open(url, "js-oauth", 'width=800, height=600')

    true

HTTPClient      = require './HTTPClient'

class Players extends HTTPClient
  get: (login) ->
    execute('get','player/')
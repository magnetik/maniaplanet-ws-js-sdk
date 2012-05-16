root = exports ? this

root.Players = class Players extends HTTPClient
  get: (login) ->
    execute('get','player/')


class Manialinks extends HTTPClient
  get: (code, callback) ->
    execute('get',"manialinks/#{code}", callback)


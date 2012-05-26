class Manialinks extends HTTPClient
  get: (code) ->
    execute('get',"manialinks/#{code}")


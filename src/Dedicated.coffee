class Dedicated extends HTTPClient
  get: (login) ->
    execute('get',"dedicated/#{login}")


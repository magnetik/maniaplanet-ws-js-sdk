class Dedicated extends HTTPClient
  get: (login, callback) ->
    @execute('get',"dedicated/#{login}", callback)


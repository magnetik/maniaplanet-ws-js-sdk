class Foobar extends HTTPClient
  get: (callback) ->
    @execute('get',"foobar/", callback)

class Players extends HTTPClient
  get: (login, callback) =>
    @execute('get',"players/#{login}", callback)


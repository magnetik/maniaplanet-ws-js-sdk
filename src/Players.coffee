class Players extends HTTPClient
  get: (login) =>
    @execute('get',"players/#{login}")


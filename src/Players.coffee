class Players extends HTTPClient
  get: (login) =>
    @execute('get',"player/#{login}")


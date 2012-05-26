class Foobar extends HTTPClient
  get:  =>
    @execute('get',"foobar/", callback)

class Zones extends HTTPClient
  get: (id) ->
    execute('get',"zones/id/#{id}")
  getByPath: (path) ->
    execute('get',"zones/path/#{path}")
  getAll: (offset = 0, length = 10, sort = '', order = '') ->
    execute('get',"zones/all/?offset=#{offset}&length=#{length}&sort=#{sort}&order=#{order}")
  getChildren: (id, offset = 0, length = 10, sort = '', order = '') ->
    execute('get',"zones/id/#{id}/children/?offset=#{offset}&length=#{length}&sort=#{sort}&order=#{order}")
  getChildrenByPath: (path, offset = 0, length = 10, sort = '', order = '') ->
    execute('get',"zones/path/#{path}/children/?offset=#{offset}&length=#{length}&sort=#{sort}&order=#{order}")
  getId: (path) ->
    execute('get',"zones/path/#{path}/id")
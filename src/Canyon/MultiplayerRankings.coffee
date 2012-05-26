class MultiplayerRankings extends HTTPClient
  getPlayer: (login) ->
    execute('get',"canyon/rankings/multiplayer/player/#{login}")
  getWorld: (offset = 0, length = 10) ->
    execute('get',"canyon/rankings/multiplayer/zone/?offset=#{offset}&length=#{length}")
  getZone: (path, offset = 0, length = 10) ->
    execute('get',"canyon/rankings/multiplayer/zone/#{path}/?offset=#{offset}&length=#{length}")
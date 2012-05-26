class SoloRankings extends HTTPClient
  getPlayer: (login) ->
    execute('get',"canyon/rankings/solo/player/#{login}")
  getWorld: (offset = 0, length = 10) ->
    execute('get',"canyon/rankings/solo/zone/?offset=#{offset}&length=#{length}")
  getZone: (path, offset = 0, length = 10) ->
    execute('get',"canyon/rankings/solo/zone/#{path}/?offset=#{offset}&length=#{length}")
  getChallengeWorld: (challengeuid, offset = 0, length = 10) ->
    execute('get',"canyon/rankings/solo/challenges/#{challengeuid}/?offset=#{offset}&length=#{length}")
  getChallengeZone: (challengeuid, path, offset = 0, length = 10) ->
    execute('get',"canyon/rankings/solo/challenges/#{challengeuid}/#{path}/?offset=#{offset}&length=#{length}")
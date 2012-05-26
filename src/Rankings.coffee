class Rankings extends HTTPClient
  constructor: (@environment, @kind) ->
  
  getPlayer: (login) ->
    execute('get', @environment + "/rankings/" + @kind + "/player/#{login}")
  getWorld: (offset = 0, length = 10) ->
    execute('get', @environment + "/rankings/" + @kind + "/zone/?offset=#{offset}&length=#{length}")
  getZone: (path, offset = 0, length = 10) ->
    execute('get', @environment + "/rankings/" + @kind + "/zone/#{path}/?offset=#{offset}&length=#{length}")
  getChallengeWorld: (challengeuid, offset = 0, length = 10) ->
      execute('get', @environment + "/rankings/solo/challenges/#{challengeuid}/?offset=#{offset}&length=#{length}") if @kind = 'solo'
  getChallengeZone: (challengeuid, path, offset = 0, length = 10) ->
      execute('get', @environment + "/rankings/solo/challenges/#{challengeuid}/#{path}/?offset=#{offset}&length=#{length}") if @kind = 'solo'
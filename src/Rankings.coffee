class Rankings extends HTTPClient 
  initRankings: (@environment, @kind) ->
  
  getPlayer: (login, callback) ->
    @execute('get', @environment + "/rankings/" + @kind + "/player/#{login}", callback)
  getWorld: (offset = 0, length = 10, callback) ->
    @execute('get', (@environment + "/rankings/" + @kind + "/zone/?offset=#{offset}&amp;length=#{length}"), callback)
  getZone: (path, offset = 0, length = 10, callback) ->
    @execute('get', @environment + "/rankings/" + @kind + "/zone/#{path}/?offset=#{offset}&amp;length=#{length}", callback)
  getChallengeWorld: (challengeuid, offset = 0, length = 10, callback) ->
    @execute('get', @environment + "/rankings/solo/challenges/#{challengeuid}/?offset=#{offset}&amp;length=#{length}", callback) if @kind = 'solo'
  getChallengeZone: (challengeuid, path, offset = 0, length = 10, callback) ->
    @execute('get', @environment + "/rankings/solo/challenges/#{challengeuid}/#{path}/?offset=#{offset}&amp;length=#{length}", callback) if @kind = 'solo'
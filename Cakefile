# from https://github.com/jashkenas/coffee-script/wiki/[HowTo]-Compiling-and-Setting-Up-Build-Tools
fs     = require 'fs'
{exec} = require 'child_process'

appFiles  = [
  # omit src/ and .coffee to make the below lines a little shorter
  'ManiaConnect/Client',
  'HTTPClient',
  'Canyon/MultiplayerRankings',
  'Canyon/SoloRankings',
  'Dedicated',
  'Manialinks',
  'Players',
  'Zones',
  'ManiaPlanet'
]

task 'build', 'Build single application file from source files', ->
  appContents = new Array remaining = appFiles.length
  for file, index in appFiles then do (file, index) ->
    fs.readFile "src/#{file}.coffee", 'utf8', (err, fileContents) ->
      throw err if err
      appContents[index] = fileContents
      process() if --remaining is 0
  process = ->
    fs.writeFile 'bin/ManiaPlanet.coffee', appContents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      exec 'coffee --compile bin/ManiaPlanet.coffee', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink 'bin/ManiaPlanet.coffee', (err) ->
          throw err if err
          console.log 'Done.'
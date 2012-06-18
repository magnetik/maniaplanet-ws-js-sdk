jasmine       = require('jasmine-node')
ManiaPlanet   = require('../bin/ManiaPlanet')
$             = require('jQuery')

describe 'ManiaPlanet', ->
  @username = process.argv[1]
  @password = process.argv[2]
  
  it 'foobar', =>
    foobar = new Foobar(@username, @password)
    callback = jasmine.createSpy("callback")
    foobar.get(callback)
    waitsFor ->
      callback.callCount > 0
    runs ->
      expect(callback).toHaveBeenCalled()
      expect(callback.mostRecentCall.args[0]).toEqual(42)
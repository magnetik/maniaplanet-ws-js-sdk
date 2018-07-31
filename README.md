#ManiaPlanet WebServices JavaScript SDK

JavaScript port of the official [ManiaPlanet WS PHP SDK](http://code.google.com/p/maniaplanet-ws-sdk/).

It's using CoffeeScript because I wanted to try it (:

##Build

###Requirements

As compiled file are JavaScript, you can use it with any JavaScript interpreter. It's tested with latest [node.js](http://www.nodejs.org).

If you want to run unit tests, you will need [jasmine node](https://github.com/mhevery/jasmine-node).

###Installation

A CakeFile is used in order to generate all required files.

Just type `cake build` and the file `build/ManiaPlanet.js` will be generated. You can use it in any project.

##Usage

Usage is quite the same as the PHP SDK. 


##Tests

The framework [Jasmine](https://jasmine.github.io/) is used to do unit test coverage.

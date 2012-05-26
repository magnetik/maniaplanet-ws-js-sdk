// Generated by CoffeeScript 1.3.3
(function() {
  var $, Client, Dedicated, HTTPClient, Manialinks, Players, Rankings, Zones, root,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Client = (function() {

    function Client() {}

    Client.baseUrl = 'https://ws.maniaplanet.com/';

    Client.tokenUrl = "" + Client.baseUrl + "/oauth2/token/";

    Client.authorizeUrl = "" + Client.baseUrl + "/oauth2/authorize/";

    Client.prototype.getAuthorizationURL = function() {};

    return Client;

  })();

  $ = jQuery;

  HTTPClient = (function() {

    function HTTPClient(username, password) {
      this.username = username;
      this.password = password;
      this.apiURL = 'https://ws.maniaplanet.com/';
      if (!(this.username != null) || !(this.password != null)) {
        throw new SyntaxError('Please specify an username and a password');
      }
    }

    HTTPClient.prototype.execute = function(method, ressource, callback) {
      var url;
      url = this.apiURL + ressource + '/';
      return $.ajax(url, {
        type: method,
        dataType: 'jsonp',
        jsonp: 'jsonp_callback',
        username: this.username,
        password: this.password,
        xhrFields: {
          withCredentials: true
        },
        error: function(jqXHR, textStatus, errorThrown) {
          return callback(jqXHR(textStatus(errorThrown)));
        },
        success: function(data, textStatus, jqXHR) {
          return callback(data, textStatus, jqXHR);
        }
      });
    };

    return HTTPClient;

  })();

  Dedicated = (function(_super) {

    __extends(Dedicated, _super);

    function Dedicated() {
      return Dedicated.__super__.constructor.apply(this, arguments);
    }

    Dedicated.prototype.get = function(login, callback) {
      return execute('get', "dedicated/" + login, callback);
    };

    return Dedicated;

  })(HTTPClient);

  Manialinks = (function(_super) {

    __extends(Manialinks, _super);

    function Manialinks() {
      return Manialinks.__super__.constructor.apply(this, arguments);
    }

    Manialinks.prototype.get = function(code, callback) {
      return execute('get', "manialinks/" + code, callback);
    };

    return Manialinks;

  })(HTTPClient);

  Players = (function(_super) {

    __extends(Players, _super);

    function Players() {
      this.get = __bind(this.get, this);
      return Players.__super__.constructor.apply(this, arguments);
    }

    Players.prototype.get = function(login, callback) {
      return this.execute('get', "players/" + login, callback);
    };

    return Players;

  })(HTTPClient);

  Rankings = (function(_super) {

    __extends(Rankings, _super);

    function Rankings() {
      return Rankings.__super__.constructor.apply(this, arguments);
    }

    Rankings.prototype.initRankings = function(environment, kind) {
      this.environment = environment;
      this.kind = kind;
    };

    Rankings.prototype.getPlayer = function(login, callback) {
      return this.execute('get', this.environment + "/rankings/" + this.kind + ("/player/" + login), callback);
    };

    Rankings.prototype.getWorld = function(offset, length, callback) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      return this.execute('get', this.environment + "/rankings/" + this.kind + ("/zone/?offset=" + offset + "&length=" + length), callback);
    };

    Rankings.prototype.getZone = function(path, offset, length, callback) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      return this.execute('get', this.environment + "/rankings/" + this.kind + ("/zone/" + path + "/?offset=" + offset + "&length=" + length), callback);
    };

    Rankings.prototype.getChallengeWorld = function(challengeuid, offset, length, callback) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      if (this.kind = 'solo') {
        return this.execute('get', this.environment + ("/rankings/solo/challenges/" + challengeuid + "/?offset=" + offset + "&length=" + length), callback);
      }
    };

    Rankings.prototype.getChallengeZone = function(challengeuid, path, offset, length, callback) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      if (this.kind = 'solo') {
        return this.execute('get', this.environment + ("/rankings/solo/challenges/" + challengeuid + "/" + path + "/?offset=" + offset + "&length=" + length), callback);
      }
    };

    return Rankings;

  })(HTTPClient);

  Zones = (function(_super) {

    __extends(Zones, _super);

    function Zones() {
      return Zones.__super__.constructor.apply(this, arguments);
    }

    Zones.prototype.get = function(id) {
      return execute('get', "zones/id/" + id);
    };

    Zones.prototype.getByPath = function(path) {
      return execute('get', "zones/path/" + path);
    };

    Zones.prototype.getAll = function(offset, length, sort, order) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      if (sort == null) {
        sort = '';
      }
      if (order == null) {
        order = '';
      }
      return execute('get', "zones/all/?offset=" + offset + "&length=" + length + "&sort=" + sort + "&order=" + order);
    };

    Zones.prototype.getChildren = function(id, offset, length, sort, order) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      if (sort == null) {
        sort = '';
      }
      if (order == null) {
        order = '';
      }
      return execute('get', "zones/id/" + id + "/children/?offset=" + offset + "&length=" + length + "&sort=" + sort + "&order=" + order);
    };

    Zones.prototype.getChildrenByPath = function(path, offset, length, sort, order) {
      if (offset == null) {
        offset = 0;
      }
      if (length == null) {
        length = 10;
      }
      if (sort == null) {
        sort = '';
      }
      if (order == null) {
        order = '';
      }
      return execute('get', "zones/path/" + path + "/children/?offset=" + offset + "&length=" + length + "&sort=" + sort + "&order=" + order);
    };

    Zones.prototype.getId = function(path) {
      return execute('get', "zones/path/" + path + "/id");
    };

    return Zones;

  })(HTTPClient);

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.Players = Players;

  root.Manialinks = Manialinks;

  root.Dedicated = Dedicated;

  root.Zones = Zones;

  root.Rankings = Rankings;

}).call(this);

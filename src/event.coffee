exports = window

class Event
  constructor: (@type, @name, @args...) ->
    @context = {}
    @hook = @type + ' ' + @name

  setContext: (server, channel) ->
    @context = {server, channel}

  @wrap: (obj) ->
    return obj if obj instanceof Event
    event = new Event obj.type, obj.name, obj.args...
    event.setContext obj.server, obj.channel
    event

exports.Event = Event
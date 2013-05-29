Session.setDefault('awwx-go-offline-offline', true)


Template.goOfflineHeader.status = ->
  Meteor.status().status


Template.goOfflineHeader.offline = ->
  Meteor.status().status isnt 'connected'


# Munge the retry timeout to a giant value to prevent automatic
# reconnects.

Meteor.default_connection._stream._retryTimeout = ->
  365 * 24 * 60 * 60 * 1000


# Abort connecting, if we're supposed to be offline.

if Session.get('awwx-go-offline-offline')
  Meteor.default_connection._stream._lostConnection()


Template.goOfflineHeader.events
  'click #awwx-go-offline-goOnline': ->
    Session.set('awwx-go-offline-offline', false)
    Meteor.reconnect()
    return

  'click #awwx-go-offline-goOffline': ->
    Session.set('awwx-go-offline-offline', true)
    Meteor.default_connection._stream._lostConnection()
    return

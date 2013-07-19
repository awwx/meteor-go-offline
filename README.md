# go-offline

Adds a header to your app with a button to toggle whether your
application has a livedata connection for testing.

This package munges Meteor's reconnect timeout to a large value which
prevents Meteor from automatically reconnecting.  Clicking the "Go
Offline" button closes Meteor's livedata connection to the server, and
clicking "Go Online" calls `Meteor.connect()` to reestablish the
connection.

This hack has some limitations:

* The usual live code reload won't happen automatically.  Meteor's
  normal reconnect behavior is blocked, so when the server restarts
  with new code the client goes "offline".  The client won't load the
  new code until you manually click the "Go Online" button or refresh
  the page.

* While the app starts up "offline" (that is, without a livedata
  connection), the application's code can still be loaded from the
  server.  (If the browser was really offline you'd need to use the
  appcache for the app to be able to load its code offline).

* Other code isn't prevented from calling `Meteor.connect()`, which
  causes the application to go "online". (For example, Meteor will
  reconnect if the browser reports that its Internet connection has
  transitioned from offline to online).

* Because the reconnect timeout is changed you won't see Meteor normal
  reconnect behavior of periodically attempting a connection.

A more realistic emulation of having an app lose its Internet
connection can be done by using an HTTP proxy.

But for simple testing of an application's offline behavior this
package can be handy.


## Use

### Meteorite

```
mrt add go-offline
```

### Meteor

Add the package to the "packages" directory of
your application:

```
$ git clone -b v1.0.0 git://github.com/awwx/meteor-go-offline.git packages/go-offline
```

### Header

And then add the header to your body:

```
<body>
  {{> goOfflineHeader}}
  ...
</body>
```

## Support

Support this package (and more like it!) by
making a weekly contribution with
[Gittip](https://www.gittip.com/awwx/).

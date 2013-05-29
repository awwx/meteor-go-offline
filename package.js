Package.describe({
  summary: "add a header to the web page with a button to go offline"
});

Package.on_use(function (api) {
  api.use([
    'coffeescript',
    'jquery',
    'templating'
  ], 'client');
  api.add_files([
    'go-offline.css',
    'go-offline.html',
    'go-offline.coffee'
  ], 'client');
});

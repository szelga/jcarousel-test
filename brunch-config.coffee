sysPath = require 'path'

rootPath = sysPath.resolve '.' + '/build/'

commonRequireDefinition = require 'commonjs-require-definition'

startsWith = (string, substring) ->
  string.lastIndexOf(substring, 0) is 0

exports.config =
  overrides:
    development:
      optimize: false
    demo:
      optimize: false
    production:
      optimize: true
  # See http://brunch.io/#documentation for docs.
  paths:
    public: rootPath
    watched: ['app', 'test', 'vendor']
  conventions:
    ignored: (path) ->
      path = sysPath.basename(path)
      startsWith(path, '_') or startsWith(path, '.#')
  modules:
    definition: (path, data) ->
      if sysPath.basename(path) in ['app.js', 'vendor.js']
        commonRequireDefinition
      else
        ""
  files:
    javascripts:
      joinTo:
        'app.js': /^(app|vendor|bower_components)/
    stylesheets:
      joinTo:
        'app.css': /^(app|vendor|bower_components)/

    templates:
      joinTo: 'app.js'


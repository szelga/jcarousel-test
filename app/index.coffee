routes = require 'routes'
Application = Chaplin.Application

$ ->
  application = new Application
    routes: routes
    root: '/'
    controllerSuffix: '_controller'
    title: 'JCarousel test'
    titleTemplate: _.template("<%= title %> | <%= subtitle %>")

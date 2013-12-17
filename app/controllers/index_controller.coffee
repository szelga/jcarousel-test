Controller = require 'controllers/base/controller'

IndexView = require 'views/index/view'

module.exports = class IndexController extends Controller
  catalog_collapse: false

  index: (params) ->
    @view = new IndexView {autoRender: false}
    @view.render()
    return

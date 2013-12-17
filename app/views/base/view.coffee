module.exports = class View extends Chaplin.View
  containerMethod: 'html'

  get_template: ->
    template = @template or null
    template

  getTemplateFunction: ->
    template = @template or null
    template = @get_template() or null
    if typeof (template) is "string"
      require template
    else if typeof (template) is "function"
      template
    else
      (c) ->
        ""

View = require 'views/base/view'

module.exports = class IndexView extends View
  template: 'views/index/template'
  container: '.page-container'

  render: ->
    super

    connector = (itemNavigation, carouselStage) ->
      carouselStage.jcarousel("items").eq itemNavigation.index()

    # Setup the carousels. Adjust the options for both carousels here.
    carouselStage = @$el.find(".carousel-stage").jcarousel()
    carouselNavigation = @$el.find(".carousel-navigation").jcarousel()
    
    # We loop through the items of the navigation carousel and set it up
    # as a control for an item from the stage carousel.
    carouselNavigation.jcarousel("items").each ->
      item = $(@)
      
      # This is where we actually connect to items.
      target = connector(item, carouselStage)
      item.on("active.jcarouselcontrol", ->
        carouselNavigation.jcarousel "scrollIntoView", @
        item.addClass "active"
      ).on("inactive.jcarouselcontrol", ->
        item.removeClass "active"
      ).jcarouselControl
        target: target
        carousel: carouselStage

    # Setup controls for the stage carousel
    @$el.find(".prev-stage").on("inactive.jcarouselcontrol", ->
      $(@).addClass "inactive"
    ).on("active.jcarouselcontrol", ->
      $(@).removeClass "inactive"
    ).jcarouselControl target: "-=1"
    @$el.find(".next-stage").on("inactive.jcarouselcontrol", ->
      $(@).addClass "inactive"
    ).on("active.jcarouselcontrol", ->
      $(@).removeClass "inactive"
    ).jcarouselControl target: "+=1"
    
    # Setup controls for the navigation carousel
    @$el.find(".prev-navigation").on("inactive.jcarouselcontrol", ->
      $(@).addClass "inactive"
    ).on("active.jcarouselcontrol", ->
      $(@).removeClass "inactive"
    ).jcarouselControl target: "-=1"
    @$el.find(".next-navigation").on("inactive.jcarouselcontrol", ->
      $(@).addClass "inactive"
    ).on("active.jcarouselcontrol", ->
      $(@).removeClass "inactive"
    ).jcarouselControl target: "+=1"

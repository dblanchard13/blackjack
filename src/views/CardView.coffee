class window.CardView extends Backbone.View
  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'
  template: _.template 'url("img/cards/<%= rankName %>-<%= suitName %>.png")'



  initialize: -> @render()

  render: ->
    @$el.children().detach()
    # @$el.html @template @model.attributes
    @$el.css "background-image", @template @model.attributes
    @$el.attr 'id', 'covered' unless @model.get 'revealed'


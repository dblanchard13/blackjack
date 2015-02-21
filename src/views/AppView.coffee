class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="reset-button">Reset</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': ->
      if !@gameOver
        @model.get('playerHand').hit()

    'click .stand-button': ->
      if !@gameOver
        @model.get('playerHand').stand() #stop this hand from moving
    'click .reset-button': ->
      @model.reset()
      @render()
      @gameOver = false

  initialize: ->
    @render()
    @model.on 'gameOver', => @gameOver = true
    @gameOver = false


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


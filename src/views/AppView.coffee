class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    # Adds a card from the deck to players hand
      # check player score
        #if above 21
          # player bust, comp wins
        # else
          # players turn again

    'click .stand-button': -> @model.get('playerHand').stand() #stop this hand from moving
                              #dealer.startHitting();
    # Now it's the dealer's turn
      # flip covered card
      # if score <17
        # hit
      # if score >21
        # comp bust, player win
      # else
        # compare comp score with player score
          # higher score wins

  initialize: ->
    # @model.get('playerHand').on 'bust', => alert 'You Lose, sucka'
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el


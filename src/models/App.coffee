# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    # @set 'deck', deck = new Deck()
    # @set 'playerHand', deck.dealPlayer()
    # @set 'dealerHand', deck.dealDealer()
    # @set 'game', game = new Game()
    # @set 'playerHand', deck.get 'playerHand'
    # @set 'dealerHand', deck.get 'dealerHand'
    #TODO: change everywhere else that called this to ie App.Game.playHand

    #function()
    #while dealer hand < 17
      # hit
    #stand();

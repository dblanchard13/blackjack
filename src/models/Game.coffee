# Handles all game logic, including: changing turns
# where future functionality will be added (ie. betting, tallying winnings, etc.)
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', => 


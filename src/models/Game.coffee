# Handles all game logic, including: changing turns
# where future functionality will be added (ie. betting, tallying winnings, etc.)
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'stand', =>
      @get('dealerHand').dealerPlay()
      #compare scores
      #dealer bust
      if @get('dealerHand').scores() > 21
        #you win
        return
      score = @get('playerHand').scores() - @get('dealerHand').scores()
      if score > 0
        # you win
        return
      if score < 0
        # you lose
        return
      else
        # draw
        return

    @get('playerHand').on 'bust', =>
      #dealer wins
      #reset game





# Handles all game logic, including: changing turns
# where future functionality will be added (ie. betting, tallying winnings, etc.)
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @addListeners()


  addListeners: ->
    @get('playerHand').on 'stand', =>
      @get('dealerHand').dealerPlay()
      #compare scores
      #dealer bust
      if @get('dealerHand').scores() > 21
        #you win
        alert('You Win, Balla!')
      else
        score = @get('playerHand').scores() - @get('dealerHand').scores()
        if score > 0
          alert('You Win, Balla!')
          # you win
        if score < 0
          alert('You Lose, Foo!')
          # you lose
        if score == 0
          # draw
          alert('Tie, you fuckin kidding me!?')

      # @reset()
      @trigger 'gameOver'
      # @set 'gameOver', true

    @get('playerHand').on 'bust', =>
      alert('busted, son!')
      @trigger 'gameOver'

      # @set 'gameOver', true
      # @reset()
      #dealer wins
      #reset game

  reset: ->
    if @get('deck').length < 10
      @set 'deck', new Deck()
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @addListeners()



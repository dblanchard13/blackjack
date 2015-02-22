# Handles all game logic, including: changing turns
# where future functionality will be added (ie. betting, tallying winnings, etc.)
class window.Game extends Backbone.Model
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
        setTimeout(@displayResults.bind(this, 'win'), 500)
      else
        score = @get('playerHand').scores() - @get('dealerHand').scores()
        if score > 0
          setTimeout(@displayResults.bind(this, 'win'), 500)
          # you win
        if score < 0
          setTimeout(@displayResults.bind(this, 'lose'), 500)
          # you lose
        if score == 0
          # draw
          setTimeout(@displayResults.bind(this, 'draw'), 500)

      # @reset()
      @trigger 'gameOver'
      # @set 'gameOver', true

    @get('playerHand').on 'bust', =>
      setTimeout(@displayResults.bind(this, 'bust'), 500)
      @trigger 'gameOver'

      # @set 'gameOver', true
      # @reset()
      #dealer wins
      #reset game

  displayResults: (event) ->
    switch event
      when 'win' then alert('You Win, Balla!')
      when 'lose' then alert('You Lose, Foo!')
      when 'draw' then alert('Tie, you fuckin kidding me!?')
      when 'bust' then alert('Busted, son!')

  reset: ->
    if @get('deck').length < 10
      @set 'deck', new Deck()
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @addListeners()



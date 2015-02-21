class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())

  stand: ->
    @trigger 'stand'

  dealerPlay: ->
    @.at(0).flip()
    while @scores() < 17
      @hit()
    return undefined

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    scoreOptions = [@minScore(), @minScore() + 10 * @hasAce()]
    if scoreOptions[0] > 21 then @trigger 'bust'
    if scoreOptions[1] > 21
      scoreOptions[0]
    else
      scoreOptions[1]

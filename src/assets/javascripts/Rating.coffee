class Rating

  targetNode: null

  targetNodes: null

  constructor: (@targetNode, @targetNodes) ->
    @observe @targetNodes
    do @updateRating

  updateRating: =>
    values = []
    for targetNode in @targetNodes
      values.push $(targetNode).val()
    rating = values
      .map (n, i, a) ->
        n / a.length
      .reduce (a, b) ->
        a + b
    $(@targetNode).html "#{rating.toFixed 1}"
    return

  observe: (targetNodes) ->
    $(targetNodes).on 'change', @updateRating


module.exports = Rating

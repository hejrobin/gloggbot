Rating = require './Rating'

targetNode = $('.score__value').get 0
targetNodes = $ '.rating__input'

rating = new Rating targetNode, targetNodes

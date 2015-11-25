appMiddleware = (request, response, next) ->
  do next if next


module.exports = appMiddleware

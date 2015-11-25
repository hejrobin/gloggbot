routesConfig = (app, express) ->

  # Default middleware
  app.use (request, response, next) ->
    contextAttributes = request.url.split '/'
      .filter (item) ->
        return item.length > 0
    controllerName = do contextAttributes.shift
    actionName = do contextAttributes.shift
    app.locals.controllerName = controllerName ? 'app'
    app.locals.actionName = actionName ? 'index'
    app.locals.contextAttributes = contextAttributes
    do next

  # Application routes
  appRouter = do express.Router
  app.use '', appRouter
  appRouter.use require 'config/routes/app'

  # 404 Page Not Found
  app.use (request, response) ->
    response.status(404).send '404 Page Not Found'

  # 500 Internal Server Error
  app.use (error, request, response, next) ->
    response.status(500).send '500 Internal Server Error'
    console.log error


module.exports = routesConfig

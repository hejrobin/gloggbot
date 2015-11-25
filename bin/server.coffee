path                  = require 'path'
csrf                  = require 'csurf'
appModulePath         = require 'app-module-path'
rootPath              = path.join __dirname, '..'
appPath               = path.join rootPath, 'src'
rootRequire           = appModulePath.addPath rootPath
appRequire            = appModulePath.addPath appPath
appConfig             = require 'config/app'
envConfig             = require 'config/env'
express               = require 'express'
colors                = require 'colors'

app = do express

# Bootstrap
require('config/server') app, express
require('config/routes') app, express

# Server
unless envConfig.APP_ENV is 'test'

  appName = appConfig.appName.green
  appPort = "#{envConfig.APP_PORT}".cyan

  # Run server
  app.listen envConfig.APP_PORT, ->
    console.log "Application #{appName} is running on #{appPort}."

  # Capture errors
  app.on 'error', (error) ->
    switch error.code
      when 'EADDRINUSE'
        console.error "Port #{appPort} already in use."
        process.exit 1

  # CSRF middleware
  if process.env.NODE_ENV isnt 'test'
    app.use do csrf
    app.use (request, response, next) ->
      response.locals.csrfToken = do request.csrfToken
      do next
      return


module.exports = app

path                    = require 'path'
appConfig               = require 'config/app'
envConfig               = require 'config/env'
bodyParser              = require 'body-parser'
morgan                  = require 'morgan'
winston                 = require 'winston'
{createEngine}          = require 'express-cjsx'
{extend}                = require 'libs/Mutate'

serverConfig = (app, express) ->

  # Assets
  publicPath = path.join __dirname, '..', '..', 'public'
  app.use express.static path.join publicPath
  app.use '/assets', express.static path.join publicPath, 'assets'
  app.use '/images', express.static path.join publicPath, 'images'

  # Logging
  if envConfig.APP_ENV isnt 'development'
    log = stream: write: (message, encoding) ->
      winston.info message

  if envConfig.APP_ENV isnt 'test'
    app.use morgan log ? 'dev'

  # Rendering
  app.set 'views', path.join __dirname, '..', 'views'
  app.set 'view engine', 'cjsx'
  app.engine 'cjsx', createEngine
    beautify: envConfig.outputRendering.beautifyOutput

  # Request handling
  app.use do bodyParser.json
  app.use bodyParser.urlencoded extended: yes


module.exports = serverConfig

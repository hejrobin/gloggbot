appConfig             = require 'config/app'

defaultsConfig =

  APP_ENV:  process.env.NODE_ENV  or appConfig.defaultEnv
  APP_PORT: process.env.PORT      or appConfig.defaultPort

  outputRendering:
    beautifyOutput: yes


module.exports = defaultsConfig

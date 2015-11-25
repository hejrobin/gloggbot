appConfig             = require 'config/app'
envConfig             = require "config/envs/#{process.env.NODE_ENV or appConfig.defaultEnv}"


module.exports = envConfig

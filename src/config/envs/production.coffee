{extend}                = require 'libs/Mutate'
defaults                = require 'config/envs/defaults'

developmentConfig = extend defaults,

  outputRendering:
    beautifyOutput: no

module.exports = developmentConfig

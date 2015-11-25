grunt = require 'grunt'

module.exports =
  options:
    banner: "/*! @build #{ grunt.template.today() } */"
    mangle: off
    compress:
      drop_console: on
  build:
    src: 'public/assets/main.js'
    dest: 'public/assets/main.js'

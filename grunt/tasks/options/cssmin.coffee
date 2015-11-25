grunt = require 'grunt'

module.exports =
  options:
    banner: "/*! @build #{ grunt.template.today() } */"
    report: 'min'
  build:
    files:
      'public/assets/style.css': [ 'public/assets/style.css' ]

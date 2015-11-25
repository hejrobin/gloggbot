module.exports = (grunt) ->

  grunt.registerTask 'build', 'Lints, compiles and builds hm.js bundle.', ->

    compileProduction = grunt.option 'production'
    compileStage = grunt.option 'stage'

    if compileProduction or compileStage
      grunt.task.run 'env:production'

    grunt.task.run 'coffeelint'
    grunt.task.run 'browserify:main'
    grunt.task.run 'less'

    if compileProduction
      grunt.task.run 'uglify'
      grunt.task.run 'cssmin'
      grunt.task.run 'clean'

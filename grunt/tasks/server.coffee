module.exports = (grunt) ->

  grunt.registerTask 'server', 'Starts development server (nodemon)', ->

    grunt.task.run 'exec:server'

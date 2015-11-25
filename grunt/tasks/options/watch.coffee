module.exports =
  less:
    files: [ 'src/assets/stylesheets/**/*.less' ]
    tasks: [ 'less', 'imagemin' ]
  app:
    files: [ 'src/{actions,components,config,constants,dispatchers,stores}/**/*.{js,coffee,cjsx}' ]
    tasks: [ 'browserify:app' ]
  main:
    files: [ 'src/{libs,assets}/**/*.{js,coffee}' ]
    tasks: [ 'browserify:main' ]
  #test:
  #  files: [ 'tests/**/*.{js,coffee,cjsx}' ]
  #  tasks: [ 'exec:test' ]

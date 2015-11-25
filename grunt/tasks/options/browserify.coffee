module.exports =
  app:
    options:
      transform: [ 'coffee-reactify' ]
      browserifyOptions:
        extensions: [ '.coffee', '.cjsx' ]
        paths: [ './src' ]
    files:
      'public/assets/app.js': 'src/components/Bootstrap.cjsx'
  main:
    options:
      transform: [ 'coffeeify' ]
      browserifyOptions:
        extensions: [ '.coffee' ]
        paths: [ './src' ]
    files:
      'public/assets/main.js': 'src/assets/javascripts/main.coffee'

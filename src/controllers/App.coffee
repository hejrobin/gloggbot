class App

  @index: (request, response) ->
    response
      .render 'app/index',
        wrapAt: 720


module.exports = App

React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'
appConfig               = require "config/app"
envConfig               = require "config/env"

class AppLayout extends Component

  wrapOptions = [
    720
    960
    1200
  ]

  @propTypes =
    pageTitle:     PropTypes.string.isRequired
    overrideTitle: PropTypes.bool
    wrapAt:        PropTypes.oneOf wrapOptions

  @defaultProps =
    pageTitle:     ''
    overrideTitle: no
    wrapAt:        1200

  constructor: (newProps) ->
    super newProps

  @getPageTitle: (props) ->
    if props.overrideTitle
      return props.pageTitle or appConfig.appName
    else
      pageTitle = appConfig.appName
      if props.pageTitle
        pageTitle = props.pageTitle
      unless appConfig.appName is pageTitle
        pageTitle = "#{pageTitle} - #{appConfig.appName}"
      pageTitle

  componentClassNames: ->
    classNames "wrap-at-#{@props.wrapAt}px",
      "#{@props.controllerName}",
      "#{@props.actionName}"

  renderHead: ->
    <head>
      <meta httpEquiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta httpEquiv="Content-Script-Type" content="text/javascript" />
      <meta httpEquiv="Content-Style-Type" content="text/css" />
      <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />
      <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
      <meta name="apple-mobile-web-app-capable" content="yes" />
      <meta name="format-detection" content="telephone=no" />
      <title>{AppLayout.getPageTitle @props}</title>
      <link href="/assets/style.css" rel="stylesheet" />
    </head>

  renderBody: ->
    <div id="wrapper">
      {@props.children}
    </div>

  renderFoot: ->
    [
      <script key="asset-jQuery" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
      <script key="asset-main" src="/assets/main.js" type="text/javascript"></script>
    ]

  render: ->
    <html lang="se">
      {do @renderHead}
      <body className={do @componentClassNames}>
        {do @renderBody}
        {do @renderFoot}
      </body>
    </html>


module.exports = AppLayout

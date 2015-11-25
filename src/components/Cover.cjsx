React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Cover extends Component

  coverHues = [
    'light'
    'dark'
  ]

  coverSizes = [
    'fluid'
    'full'
    'prominent'
    'extended'
  ]

  @propTypes =
    wrap:         PropTypes.bool
    primary:      PropTypes.bool
    hue:          PropTypes.oneOf coverHues
    overlay:      PropTypes.string
    size:         PropTypes.oneOf coverSizes
    classNames:   PropTypes.object
    attributes:   PropTypes.object

  @defaultProps =
    wrap:         no
    primary:      no
    hue:          'dark'
    overlay:      null
    size:         'fluid'
    classNames:   {}
    attributes:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'cover': yes
      'cover--primary': @props.primary
      'wrap': @props.wrap
    componentClassNames["cover__overlay--#{@props.hue}"] = yes
    if @props.overlay?
      componentClassNames["cover__overlay--#{@props.overlay}"] = yes
    componentClassNames["cover--#{@props.size}"] = yes
    classNames componentClassNames, @props.classNames

  render: ->
    <article className={do @componentClassNames} {...@props.attributes}>
      {@props.children}
    </article>

module.exports = Cover

React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Avatar extends Component

  avatarShapes = [
    'square'
    'rounded'
    'circle'
    'hexagon'
  ]

  @propTypes =
    mediaUrl:     PropTypes.string.isRequired
    shape:        PropTypes.oneOf avatarShapes
    maxSize:      PropTypes.number
    classNames:   PropTypes.object
    attributes:   PropTypes.object

  @defaultProps =
    mediaUrl:     'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7'
    shape:        'square'
    maxSize:      0
    classNames:   {}
    attributes:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'avatar': yes
    componentClassNames["avatar--#{@props.shape}"] = yes
    classNames componentClassNames, @props.classNames

  componentStyles: ->
    componentStyles =
      backgroundImage: "url('#{@props.mediaUrl}')"
    if @props.maxSize > 0
      componentStyles.maxWidth = "#{@props.maxSize}px"
    componentStyles

  render: ->
    <span className={do @componentClassNames} {...@props.attributes} style={do @componentStyles}></span>

module.exports = Avatar

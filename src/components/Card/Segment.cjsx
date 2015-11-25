React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Segment extends Component

  segmentAspectRatios = [
    '1:1'
    '2:1'
    '4:3'
    '16:9'
  ]

  @propTypes =
    interactive:  PropTypes.bool
    header:       PropTypes.bool
    footer:       PropTypes.bool
    mediaUrl:     PropTypes.string
    aspectRatio:  PropTypes.oneOf segmentAspectRatios
    classNames:   PropTypes.object

  @defaultProps =
    interactive:  no
    header:       no
    footer:       no
    mediaUrl:     null
    aspectRatio:  null
    classNames:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'segment': yes
      'segment--header': @props.header
      'segment--footer': @props.footer
      'segment--interactive': @props.interactive
    if @props.aspectRatio?
      aspectRatio = @props.aspectRatio.replace ':', '-'
      componentClassNames['aspect'] = yes
      componentClassNames["aspect--#{aspectRatio}"] = yes
    if @props.mediaUrl?
      componentClassNames['segment--has-media'] = yes
    classNames componentClassNames, @props.classNames

  componentProperties: ->
    componentProperties = {}
    componentProperties.style ?= {}
    if @props.mediaUrl?
      componentProperties.style.backgroundImage = "url('#{@props.mediaUrl}')"
    componentProperties

  render: ->
    componentProperties = do @componentProperties
    <section className={do @componentClassNames} {...componentProperties}>
      {@props.children}
    </section>

module.exports = Segment

React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Button extends Component

  buttonTypes = [
    'flat'
    'ghost'
    'translucent'
  ]

  buttonActions = [
    'assertive'
    'attentive'
    'cautious'
    'destructive'
    'dismissive'
    'generic'
  ]

  @propTypes =
    label:        PropTypes.string.isRequired
    type:         PropTypes.oneOf buttonTypes
    href:         PropTypes.string
    formAction:   PropTypes.string
    busy:         PropTypes.bool
    actionType:   PropTypes.oneOf buttonActions

  @defaultProps =
    label:        'Button'
    type:         null
    href:         null
    formAction:   null
    busy:         false
    actionType:   null

  constructor: (newProps) ->
    newProps.type = 'flat' if newProps.flat?
    newProps.type = 'ghost' if newProps.ghost?
    newProps.type = 'translucent' if newProps.translucent?
    newProps.actionType = 'assertive' if newProps.assertive?
    newProps.actionType = 'attentive' if newProps.attentive?
    newProps.actionType = 'cautious' if newProps.cautious?
    newProps.actionType = 'destructive' if newProps.destructive?
    newProps.actionType = 'dismissive' if newProps.dismissive?
    newProps.actionType = 'generic' if newProps.generic?
    super newProps

  componentClassNames: ->
    componentClassNames = 'button': yes
    componentClassNames["button--#{@props.type}"] = @props.type?
    componentClassNames["button--#{@props.actionType}"] = @props.actionType?
    classNames componentClassNames

  renderAnchor: ->
    <a href={@props.href} className={do @componentClassNames}>
      {@props.label}
    </a>

  renderButton: ->
    <button className={do @componentClassNames}>
      {@props.label}
    </button>

  render: ->
    if @props.href? then do @renderAnchor else do @renderButton

module.exports = Button

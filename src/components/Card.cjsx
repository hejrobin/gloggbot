React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Card extends Component

  cardTypes = [
    'ghost'
    'translucent'
    'immaterial'
  ]

  cardActions = [
    'assertive'
    'attentive'
    'cautious'
    'destructive'
    'dismissive'
    'generic'
  ]

  @propTypes =
    type:         PropTypes.oneOf cardTypes
    href:         PropTypes.string
    actionType:   PropTypes.oneOf cardActions
    segmented:    PropTypes.bool
    interactive:  PropTypes.bool
    classNames:   PropTypes.object

  @defaultProps =
    type:         null
    href:         null
    actionType:   null
    segmented:    no
    interactive:  no
    classNames:   {}

  constructor: (newProps) ->
    newProps.interactive = true if newProps.href?
    newProps.type = 'ghost' if newProps.ghost?
    newProps.type = 'translucent' if newProps.translucent?
    newProps.type = 'immaterial' if newProps.immaterial?
    newProps.actionType = 'assertive' if newProps.assertive?
    newProps.actionType = 'attentive' if newProps.attentive?
    newProps.actionType = 'cautious' if newProps.cautious?
    newProps.actionType = 'destructive' if newProps.destructive?
    newProps.actionType = 'dismissive' if newProps.dismissive?
    newProps.actionType = 'generic' if newProps.generic?
    super newProps

  componentClassNames: ->
    componentClassNames =
      'card': yes
      'card--segmented': @props.segmented
      'card--interactive': @props.interactive
    componentClassNames["card--#{@props.type}"] = @props.type?
    unless @props.type is 'immaterial'
      componentClassNames["card--#{@props.actionType}"] = @props.actionType
    if @props.type is 'immaterial' or @props.type is 'translucent'
      componentClassNames['card--interactive'] = false
    classNames componentClassNames, @props.classNames

  renderAnchor: ->
    <a href={@props.href} className={do @componentClassNames}>
      {@props.children}
    </a>

  renderArticle: ->
    <article className={do @componentClassNames}>
      {@props.children}
    </article>

  render: ->
    if @props.href? then do @renderAnchor else do @renderArticle

module.exports = Card

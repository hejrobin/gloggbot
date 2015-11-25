React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Deck extends Component

  @propTypes =
    heading:      PropTypes.string.isRequired
    subheading:   PropTypes.string
    classNames:   PropTypes.object
    attributes:   PropTypes.object

  @defaultProps =
    heading:      null
    subheading:   null
    classNames:   {}
    attributes:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'deck': yes
    classNames componentClassNames, @props.classNames

  headerClassNames: ->
    classNames 'deck__header': yes

  renderHeader: ->
    subheading = if @props.subheading? then <p className="deck__subheading">{@props.subheading}</p> else null
    <header className={do @headerClassNames}>
      <h2 className="deck__heading">{@props.heading}</h2>
      {subheading}
    </header>

  render: ->
    <article className={do @componentClassNames} {...@props.attributes}>
      {do @renderHeader}
      {@props.children}
    </article>

module.exports = Deck

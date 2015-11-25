React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Board extends Component

  @propTypes =
    heading:      PropTypes.string.isRequired
    subheading:   PropTypes.string
    wrap:         PropTypes.bool
    classNames:   PropTypes.object
    attributes:   PropTypes.object

  @defaultProps =
    heading:      null
    subheading:   null
    wrap:         no
    classNames:   {}
    attributes:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'board': yes
    classNames componentClassNames, @props.classNames

  headerClassNames: ->
    classNames
      'wrap': @props.wrap
      'board__header': yes

  renderSubHeading: ->
    if @props.subheading?
      <p className="board__subheading">{@props.subheading}</p>

  renderHeader: ->
    <header className={do @headerClassNames}>
      <h2 className="board__heading">{@props.heading}</h2>
      {do @renderSubHeading}
    </header>

  render: ->
    <article className={do @componentClassNames} {...@props.attributes}>
      {do @renderHeader}
      {@props.children}
    </article>

module.exports = Board

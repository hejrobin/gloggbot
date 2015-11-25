React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Grid extends Component

  @propTypes =
    id:           PropTypes.string
    wrap:         PropTypes.bool
    cascade:      PropTypes.bool
    traverse:     PropTypes.bool
    classNames:   PropTypes.object

  @defaultProps =
    id:           null
    wrap:         no
    cascade:      yes
    traverse:     no
    classNames:   {}

  constructor: (newProps) ->
    super newProps

  componentProperties: ->
    componentProperties =
      id: @props.id
    componentProperties

  componentClassNames: ->
    componentClassNames =
      "grid": yes
      "grid--cascade": @props.cascade
      "grid--traverse": @props.traverse
      "wrap": @props.wrap
    classNames componentClassNames, @props.classNames

  render: ->
    componentProperties = do @componentProperties
    <div className={do @componentClassNames} {...componentProperties}>
      {@props.children}
    </div>


module.exports = Grid

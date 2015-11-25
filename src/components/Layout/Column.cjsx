React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class Column extends Component

  columnSizes = [
    'one-half'
    'one-third'
    'two-thirds'
    'one-quarter'
    'three-quarters'
    'one-fifth'
    'two-fifths'
    'three-fifths'
  ]

  @propTypes =
    id:           PropTypes.string
    size:         PropTypes.oneOf columnSizes
    alpha:        PropTypes.bool
    classNames:   PropTypes.object

  @defaultProps =
    id:           null
    size:         null
    alpha:        no
    classNames:   {}

  constructor: (newProps) ->
    super newProps

  componentProperties: ->
    componentProperties =
      id: @props.id
    componentProperties

  componentClassNames: ->
    componentClassNames =
      "column": yes
      "column--alpha": @props.alpha
    componentClassNames["column--#{@props.size}"] = yes
    classNames componentClassNames, @props.classNames

  render: ->
    componentProperties = do @componentProperties
    <div className={do @componentClassNames} {...componentProperties}>
      {@props.children}
    </div>


module.exports = Column

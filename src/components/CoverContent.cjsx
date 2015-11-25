React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'

class CoverContent extends Component

  @propTypes =
    wrap:         PropTypes.bool
    classNames:   PropTypes.object

  @defaultProps =
    wrap:         no
    classNames:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'cover__content': yes
      'wrap': @props.wrap
    classNames componentClassNames, @props.classNames

  render: ->
    <div className={do @componentClassNames}>
      {@props.children}
    </div>

module.exports = CoverContent

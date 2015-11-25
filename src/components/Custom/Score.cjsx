React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'
{Card}                  = require 'components/Materials'


class Rating extends Component

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'score': yes
    classNames componentClassNames

  scoreValueClassNames: ->
    componentClassNames =
      'score__value': yes
    classNames componentClassNames

  render: ->
    <Card immaterial>
      <var className={do @scoreValueClassNames}>0.00</var>
    </Card>


module.exports = Rating

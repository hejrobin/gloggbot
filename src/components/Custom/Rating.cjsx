React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'
{Card}                  = require 'components/Materials'


class Rating extends Component

  @propTypes =
    guid:         PropTypes.string.isRequired
    heading:      PropTypes.string.isRequired
    description:  PropTypes.string.isRequired
    min:          PropTypes.number
    max:          PropTypes.number
    step:         PropTypes.number
    classNames:   PropTypes.object
    attributes:   PropTypes.object

  @defaultProps =
    heading:      null
    description:  null
    min:          1
    max:          5
    step:         .5
    classNames:   {}
    attributes:   {}

  constructor: (newProps) ->
    super newProps

  componentClassNames: ->
    componentClassNames =
      'rating__input': yes
    classNames componentClassNames, @props.classNames

  render: ->
    <Card immaterial classNames={{"rating__card": yes, "rating": yes}}>
      <h2>{@props.heading}</h2>
      <p>{@props.description}</p>
      <section className="rating__container rating__container--#{@props.guid}">
        <input
          type="range"
          min={@props.min}
          max={@props.max}
          step={@props.step}
          className={do @componentClassNames}
        />
      </section>
    </Card>


module.exports = Rating

React                   = require 'react/addons'
{PropTypes, Component}  = React
classNames              = require 'classnames'
AppLayout               = require 'views/layouts/app'
{Grid, Column}          = require 'components/Layout'
Materials               = require 'components/Materials'
{Board, Deck}           = Materials
{Card, CardSegment}     = Materials
Score                   = require 'components/Custom/Score'
Rating                  = require 'components/Custom/Rating'

class AppIndex extends Component

  constructor: (newProps) ->
    super newProps

  render: ->
    <AppLayout {...@props}>
      <main className="wrap">
        <Board heading="Glöggbot">
          <Score />
          <Rating guid="style" heading="Yttre" description="Vad tycker du om glöggens färg, klarhet och intensitet?" />
          <Rating guid="aroma" heading="Arom" description="Vad tycker du om glöggens doft, smak och textur?" />
          <Rating guid="x-mas" heading="Julkänsla" description="Hur mycket jul-feeling får du av denna glögg?" />
        </Board>
      </main>
    </AppLayout>

module.exports = AppIndex

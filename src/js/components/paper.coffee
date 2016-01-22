# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div, p, br } = DOM


module.exports = Paper = Himesama.createClass

  needs: [ 'paper' ]

  render: ->
    { title, date, content } = @state.paper

    content = _.map content, 
      (section, i) ->
        text = section.text
        text = text.split '\n\n'
        section.text = text
        _.map section.text, ( _p, j ) ->
          _p = '* ' + i + ' ' + _p if j is 0

          [
            p className: 'point', _p
            br null
          ]

    content = _.flatten content, true

    div className: 'paper',

      p className: 'header',     title
      p className: 'point date', date

      br null

      content

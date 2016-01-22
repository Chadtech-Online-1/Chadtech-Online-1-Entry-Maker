# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div, p, input, br } = DOM


module.exports = Archive = Himesama.createClass

  render: ->
    div className: 'archive',

      p className: 'point link', 'previous'

      p className: 'point link', 'next'

      br null
      
      p className: 'point ignorable', 'Archive'
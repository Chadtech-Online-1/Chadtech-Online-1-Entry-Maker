# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div, p } = DOM


module.exports = Title = Himesama.createClass

  goToOldChadtech: ->
    window.location.assign 'http://chadtech.github.io'

  render: ->
    div className: 'container',
      div className:    'row',
        div className:  'column',
          p className:  'header banner', 
            'Chadtech Online 1'

        div className:  'column',
          p className:  'point ignorable', 
            'Chadtech0@gmail.com'
          p 
            className: 'point link'
            event:     click: @goToOldChadtech
            'Chadtech Online 0'
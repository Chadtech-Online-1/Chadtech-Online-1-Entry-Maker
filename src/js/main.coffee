# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div } = DOM
# { row, column, point } = require './components/ct-dom'

Title         = require './components/title'
HorizontalBar = require './components/horizontal-bar'
Body          = require './components/body'

module.exports = Main = Himesama.createClass

  render: ->

    div null,
      Title()
      HorizontalBar()
      Body()






# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'

# DOM
{ textarea } = Himesama.DOM

module.exports = MessageInput = Himesama.createClass

  needs: [ 'message' ]

  prepare: ->
    { message } = @state
    if message is '^'
      @setState message: ''

  handle: (event) ->
    @setState message: event.target.value

  render: ->
    { message } = @state
    message = 'message' if message is '^'
  
    textarea
      className: 'field'
      style:
        width:  '398px'
        height: '10em'
      event:     
        input:    @handle
        click:    @prepare
      message
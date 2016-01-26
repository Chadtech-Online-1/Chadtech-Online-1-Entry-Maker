# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'

# DOM
{ input } = Himesama.DOM

module.exports = NameInput = Himesama.createClass

  needs: [ 'name', 'nameError' ]

  prepare: ->
    { name } = @state
    if name is '^'
      @setState name: ''

  handle: (event) ->
    @setState name: event.target.value

  render: ->
    { name, nameError } = @state

    name = 'name' if name is '^'
    cl   = 'field'
    if nameError
      cl += ' error'
      name = 'Name field empty!!'

    input
      className:  cl
      value:      name
      event:     
        input:    @handle
        click:    @prepare
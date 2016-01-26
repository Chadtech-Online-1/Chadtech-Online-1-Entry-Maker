# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'

# DOM
{ input } = Himesama.DOM

module.exports = EmailInput = Himesama.createClass

  needs: [ 'email', 'emailError' ]

  prepare: ->
    { email } = @state
    if email is '^'
      @setState email: ''

  handle: (event) ->
    @setState email: event.target.value

  render: ->
    { email, emailError } = @state
    
    if email is '^'
      email = 'email (not shown publicly)'

    cl = 'field'

    if emailError
      cl += ' error'
      email = 'Invalid Email!'
  

    input
      className:  cl
      value:      email
      event:     
        input:    @handle
        click:    @prepare

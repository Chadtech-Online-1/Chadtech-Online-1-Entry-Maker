# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
Parse    = require 'Parse'

# DOM
{ div, p, input, br, textarea } = Himesama.DOM

# Utility
formatDate = (date) ->
  year  = date.getFullYear()
  month = date.getMonth() + ''
  month = '0' + month if month.length is 1
  day   = date.getDate()
  day--
  hour  = date.getHours()
  year + '' + month + day + hour

# InitConversation
InitConversation = require '../init-conversation'

# Components
Name    = require './name-input'
Email   = require './email-input'
Message = require './message-input'


module.exports = Conversation = Himesama.createClass

  needs: [ 'posts' ]

  submit: ->
    { name, email, message } = @state

    emailIsGood = email isnt '^' and email isnt ''
    nameIsGood  = name isnt '^' and name isnt ''
    submitIt    = emailIsGood and nameIsGood 

    unless nameIsGood
      @setState name: '^'
      @setState nameError: true

    unless emailIsGood
      @setState email: '^'
      @setState emailError: true

    if submitIt

      Post = Parse.Object.extend 'post'
      post = new Post()

      post.set 'content',  message
      post.set 'name',     name
      post.set 'email',    email
      post.set 'verified', false

      dewit = =>
        InitConversation @setState

      post.save null,
        success: (post) -> dewit()
        error: (err) ->
          console.log 'Error :^(', err

      @setState 
        name:     '^'
        message:  '^'
        email:    '^'



  render: ->
    { posts, message, email, name } = @state

    div null,
      p 
        className: 'point ignorable'
        'Conversation'

      Name()
      Email()
      Message()

      p
        className:  'point link'
        event:      (click: @submit)
        'submit'

      br null


      div 
        style: (marginLeft: '2em')

        _.flatten _.map posts, (post) ->
          time = formatDate post.createdAt

          [
            p className: 'point name', post.name
            p className: 'point name', time
            p className: 'point', post.content
            br null
          ]


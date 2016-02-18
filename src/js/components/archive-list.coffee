# Dependencies
_        = require 'lodash'
Himesama = require 'himesama'
{ DOM }  = Himesama

# DOM
{ div, p, input, br } = DOM

Conversation = require './conversation'

# Fetch
Fetch = require '../fetch'


module.exports = Archive = Himesama.createClass

  needs: ['archive', 'paperIndex']

  goToOldChadtech: ->
    window.location.assign 'http://chadtech.github.io'

  entryAction: (i) ->
    => 
      @setState paperIndex: i
      Fetch.paper i, (payload) =>
        @setState paper: payload


  render: ->
    { archive, paperIndex } = @state

    nextButton = p 
      className: 'point link'
      event:     click: (@entryAction paperIndex + 1)
      'next'

    if paperIndex is archive.length - 1
      nextButton = p className: 'point ignorable', 'next'

    previousButton = p 
      className: 'point link', 
      event:     click: (@entryAction paperIndex - 1)
      'previous'

    if paperIndex is 0
      previousButton = p className: 'point ignorable', 'previous'

    archive = _.map archive, (entryTitle, i) =>
      i = archive.length - i - 1
      p 
        className:  'point archive-item'
        event:      click: @entryAction i
        entryTitle


    div className: 'archive',

      previousButton
      nextButton
      br null
      Conversation null
      br null
      p className: 'point ignorable', 'Archive'
      archive
      p 
        className: 'point link', 
        event:     click: @goToOldChadtech
        'Chadtech Online 0'

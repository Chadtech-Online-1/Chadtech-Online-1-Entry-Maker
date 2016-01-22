# Libraries
_                    = require 'lodash'
Himesama             = require 'himesama'
{ DOM, Doc, Render } = Himesama
{ initState }        = Himesama
{ getElementById }   = Doc

# DOM
{ div } = DOM

# State
initState 
  paperCount: 0
  paperIndex: 0
  archive:    []
  paper:
    title:    ''
    date:     ''
    content:  []

# Components
Main = require './main'

# Fetch
Fetch = require './fetch'


App = Himesama.createClass

  render: -> 

    setPaper = (payload) =>
      @setState paper: payload

    Fetch.config (payload) ->
      Fetch.paper payload.paperCount - 1, setPaper

    div null, 
      Main null


Render App(), getElementById 'mount'


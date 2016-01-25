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

    entryNumber = getElementById 'entry-number'
    if entryNumber?
      entryNumber    = entryNumber.getAttribute 'number'
      entryNumber    = parseInt entryNumber
    else entryNumber = undefined

    setPaper = (payload) =>
      @setState 
        paper:      payload
        paperIndex: entryNumber

    setArchive = (payload) =>
      @setState payload

    Fetch.config (payload) =>
      setArchive payload
      al          = payload.archive.length
      entryNumber = al - 1 unless entryNumber?
      Fetch.paper entryNumber, setPaper

    div null, 
      Main null


Render App(), getElementById 'mount'


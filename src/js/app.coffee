# Libraries
_                  = require 'lodash'
Himesama           = require 'himesama'
{ Doc, Render }    = Himesama
{ initState }      = Himesama
{ getElementById } = Doc
Parse              = require 'Parse'

# Parse
Parse.initialize "ToHdNth5WIKSg8ZFVJ5CXa0Wudccy6D8RLXv7Lmp", "XkRSAROUOyz7bMCBIGGdV4QaHIoNMQi4o0Nhnnyu"


# DOM
{ div } = Himesama.DOM

# Components
Main = require './main'

# Fetch
Fetch = require './fetch'

# Init
entryNumber = getElementById 'entry-number'
if entryNumber?
  entryNumber    = entryNumber.getAttribute 'number'
  entryNumber    = parseInt entryNumber
else entryNumber = undefined

setPaper = (payload) =>
  Himesama.setState 
    paper:      payload
    paperIndex: entryNumber

setArchive = (payload) =>
  Himesama.setState payload

Fetch.config (payload) =>
  setArchive payload
  al          = payload.archive.length
  entryNumber = al - 1 unless entryNumber?
  Fetch.paper entryNumber, setPaper

InitConversation = require './init-conversation'

# State
initState 
  paperCount: 0
  paperIndex: 0
  archive:    []
  name:       '^'
  message:    '^'
  email:      '^'
  emailError: false
  nameError:  false
  paper:
    title:    ''
    date:     ''
    content:  []

App = Himesama.createClass

  render: -> 

    InitConversation @setState

    div null, 
      Main null


Render App(), getElementById 'mount'


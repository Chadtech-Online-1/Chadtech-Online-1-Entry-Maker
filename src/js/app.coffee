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
  paperIndex: 0
  paper:
    title:    ''
    date:     ''
    content:  []

# Components
Main = require './main'


App = Himesama.createClass

  loadPaper: (req) ->
    req     = req.split '|||'
    title   = req[0]
    date    = req[1]
    content = _.map (req.slice 2), (p_) ->
      text: p_.slice 1
      type: p_[0]

    @setState paper:
      title:    title
      date:     date
      content:  content




  render: -> 

    xml = new XMLHttpRequest()
    xml.onreadystatechange = =>
      if xml.readyState is 4 and xml.status is 200
        @loadPaper xml.responseText
    xml.open 'GET', 'http://chadtech-online-1.github.io/0.txt', true
    xml.send null


    div null, 
      Main null

Render App(), getElementById 'mount'


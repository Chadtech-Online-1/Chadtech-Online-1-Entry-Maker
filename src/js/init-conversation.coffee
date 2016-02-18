# Dependencies
_     = require 'lodash'
Parse = require 'Parse'


module.exports = InitConversation = (next) ->

  Post = Parse.Object.extend 'post'
  query = new Parse.Query Post
  query.find
    success: (results) =>
      results = _.map results, 
        (result) -> result.attributes
      results = results.slice 0, 6
      results = results.reverse()
      results = _.filter results, 'verified'
      next posts: results
    error: (err) ->
      console.log 'Error :^(', err


require.config
  paths:
    'jquery': 'libs/zepto'
    'underscore': 'libs/lodash'
    'backbone': 'libs/backbone'
  shim:
    'jquery':
      exports: '$'
      
define [
  'betting'
  'winner'
  'libs/domReady'
], (BettingView, WinnerView, domReady) ->
  domReady ->
    bettingView = new BettingView el: document.body
    
    # Set up utils.
    window.global = {}
    window.global.deleteUser = (user) ->
      userObject = localStorage.getItem user
      return unless userObject
      console.log 'user', userObject 
    
    # Set up query string parser.
    query = {}
    
    window.location.search.slice(1).split('&').forEach (part) ->
      part = part.split '='
      query[part[0]] = part[1]
        
    return unless query.admin is 'true'
    
    winnerView = new WinnerView el: document.body, horses: bettingView.horses
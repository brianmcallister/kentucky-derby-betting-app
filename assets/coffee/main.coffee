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
    runningTotal = localStorage.getItem 'running-total'
    if runningTotal is null
      localStorage.setItem 'running-total', 0
            
    bettingView = new BettingView el: document.body
    
    # Set up utils.
    window.global = {}
    window.global.deleteUser = (user) ->
      userObject = JSON.parse localStorage.getItem user
      return unless userObject
      running = localStorage.getItem 'running-total'
      running = running - userObject.total
      localStorage.removeItem user
      localStorage.setItem 'running-total', running
    
    # Set up query string parser.
    query = {}
    
    window.location.search.slice(1).split('&').forEach (part) ->
      part = part.split '='
      query[part[0]] = part[1]
        
    return unless query.admin is 'true'
    
    winnerView = new WinnerView el: document.body, horses: bettingView.horses
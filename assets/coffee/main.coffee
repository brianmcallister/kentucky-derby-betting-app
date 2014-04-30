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
    
    query = {}
    
    window.location.search.slice(1).split('&').forEach (part) ->
      part = part.split '='
      query[part[0]] = part[1]
        
    return unless query.admin is 'true'
    
    winnerView = new WinnerView el: document.body, horses: bettingView.horses
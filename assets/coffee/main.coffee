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
  'libs/domReady'
], (BettingView, domReady) ->
  domReady ->
    new BettingView el: document.body
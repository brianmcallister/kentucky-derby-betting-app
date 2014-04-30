define [
  'backbone'
], (Backbone) ->
  class WinnerView extends Backbone.View
    events: ->
      'change .winner-select': 'calculate'
      
    initialize: (opts) ->
      @horses = opts.horses
      
      select = document.querySelector('.winner-select')
      html = '<option></option>'
    
      for horse in @horses
        html += "<option value='#{horse.slug}'>#{horse.name}</option>"
    
      select.innerHTML = html
      return this
      
    calculate: (event) ->
      winner = event.currentTarget.value
      bets = {}
      
      # Get bets.
      for item, index in localStorage
        key = localStorage.key index
        item = localStorage.getItem key
        bets[key] = JSON.parse item
      
      winners = []
      
      # Get winners.
      for own key, data of bets
        for horse, key in data.horses
          name = Object.keys(horse)[0]
          bet = parseInt horse[name], 10
          
          if name is winner and bet > 0
            winners.push name: data.bettor, shares: bet
      
      console.log 'winners', winners
      return this
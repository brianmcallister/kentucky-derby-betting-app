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
      totalPot = localStorage.getItem 'running-total'
      winner = event.currentTarget.value
      bets = {}
      
      # Get bets.
      for item, index in localStorage
        key = localStorage.key index
        continue if key is 'running-total'
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
      
      winners.sort (a, b) ->
        return -1 if a.shares < b.shares
        return 1 if a.shares > b.shares
        return 0
        
      winners.reverse()
      
      # Calculate the winnings.
      totalShares = 0
      amountPerShare = 0
      
      for winner in winners
        totalShares += winner.shares
        
      amountPerShare = totalPot / totalShares
      
      html = ''
      
      if winners.length
        for winner in winners
          html += "<div>#{winner.name} gets $#{winner.shares * amountPerShare}</div>"
      else
        for key, value of bets
          html += "<div>#{value.bettor} gets $#{value.total}</div>"
          
      document.querySelector('.final-winners').innerHTML = html
        
      return this
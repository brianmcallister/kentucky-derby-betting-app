define [
  'backbone'
], (Backbone) ->
  class BettingView extends Backbone.View
    events: ->
      'click .start-button': 'start'
      'submit .betting-form': 'finish'
      'click .increase': 'increase'
      'click .decrease': 'decrease'
      
    initialize: ->
      @on 'increase', -> console.log 'increase total'
      @on 'decrease', -> console.log 'decrease total'
      return this
      
    start: ->
      data = {}
      name = @el.querySelector('.bettor-name').value
      return this if not name
      data.name = name
      
      # Insert the betting page.
      betting = document.createElement 'div'
      betting.classList.add 'betting'
      betting.innerHTML = window.app.templates['assets/templates/betting.ejs'] data: data
      @el.appendChild betting
      
    increase: (event) ->
      @stopAndPrevent event
      horse = event.currentTarget.parentElement.parentElement
      name = horse.getAttribute 'data-name'
      
      amount = horse.querySelector "[name=#{name}]"
      
      bet = amount.value
      bet = parseInt(bet, 10) + 1
      
      amount.value = bet
      
      horse.querySelector('.bet-amount').textContent = "$#{bet}"
      @trigger 'increase'
      
    decrease: (event) ->
      @stopAndPrevent event
      
      horse = event.currentTarget.parentElement.parentElement
      name = horse.getAttribute 'data-name'
      
      amount = horse.querySelector "[name=#{name}]"
      
      bet = amount.value
      bet = parseInt(bet, 10) - 1
      if bet < 0 then bet = 0
      
      amount.value = bet
      
      horse.querySelector('.bet-amount').textContent = "$#{bet}"
      @trigger 'decrease'
      
    finish: (event) ->
      @stopAndPrevent event
      
      console.log 'finish'
      return this
      
      
    stopAndPrevent: (event) ->
      event.preventDefault()
      event.stopPropagation()
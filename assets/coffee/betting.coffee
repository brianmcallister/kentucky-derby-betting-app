define [
  'backbone'
], (Backbone) ->
  class BettingView extends Backbone.View
    events: ->
      'click .start-button': 'start'
      'submit .betting-form': 'finish'
      
    initialize: ->
      console.log 'init'
      
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
      
      
    finish: (event) ->
      event.preventDefault()
      event.stopPropagation()
      
      console.log 'finish'
      return this
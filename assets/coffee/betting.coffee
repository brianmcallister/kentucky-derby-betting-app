define [
  'backbone'
], (Backbone) ->
  class BettingView extends Backbone.View
    horses: [
      {name: 'California Chrome', slug: 'california-chrome', rank: '1', points: '150', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/californiachrome3-8-sm_0.jpg'}
      {name: 'Vicar\'s In Trouble', slug: 'vicars-in-trouble', rank: '2', points: '120', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/vicars-in-trouble.jpg'}
      {name: 'Dance With Fate', slug: 'dance-with-fate', rank: '3', points: '108', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/dance-with-fate_0.jpg'}
      {name: 'Wicked Strong', slug: 'wicked-strong', rank: '4', points: '102', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/wicked-strong_0.jpg'}
      {name: 'Samraat', slug: 'samraat', rank: '5', points: '100', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/samraat.jpg'}
      {name: 'Danza', slug: 'danza', rank: '6', points: '100', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/danza.jpg'}
      {name: 'Hoppertunity', slug: 'hoppertunity', rank: '7', points: '95', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/hopportunity.jpg'}
      {name: 'Intense Holiday', slug: 'intense-holiday', rank: '8', points: '93', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/intense-holiday_0.jpg'}
      {name: 'Wildcat Red', slug: 'wildcat-red', rank: '9', points: '90', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/wild-cat-red_0.jpg'}
      {name: 'We Miss Artie', slug: 'we-miss-artie', rank: '10', points: '60', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/we-miss-artie.jpg'}
      {name: 'Ride On Curlin', slug: 'ride-on-curlin', rank: '11', points: '55', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/ride-on-curlin.jpg'}
      {name: 'Chitu', slug: 'chitu', rank: '12', points: '54', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/chitu.jpg'}
      {name: 'Tapiture', slug: 'tapiture', rank: '13', points: '52', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/tapiture.jpg'}
      {name: 'General A Rod', slug: 'general-a-rod', rank: '14', points: '40', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/general-a-rod_0.jpg'}
      {name: 'Medal Count', slug: 'medal-count', rank: '15', points: '40', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/medal-count.jpg'}
      {name: 'Candy Boy', slug: 'candy-boy', rank: '16', points: '30', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/candy-boy.jpg'}
      {name: 'Uncle Sigh', slug: 'uncle-sigh', rank: '17', points: '24', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/uncle-sigh.jpg'}
      {name: 'Vinceremos', slug: 'vinceremos', rank: '18', points: '20', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/vinceramos.jpg'}
      {name: 'Harry\'s Holiday', slug: 'harrys-holiday', rank: '19', points: '20', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/harrys-holiday.jpg'}
      {name: 'Commanding Curve', slug: 'commanding-curve', rank: '20', points: '20', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/commanding-curve_0.jpg'}
      {name: 'Pablo Del Monte', slug: 'pablo-del-monte', rank: '21', points: '20', img: 'http://static.kentuckyderby.com/sites/kentuckyderby.com/files/imagecache/content_full/images/primary/pablo-del-monte.jpg'}
    ]
    
    events: ->
      'click .start-button': 'start'
      'submit .betting-form': 'finish'
      'click .increase': 'increase'
      'click .decrease': 'decrease'
      
    initialize: ->
      @on 'increase', @increaseTotal
      @on 'decrease', @decreaseTotal
      return this
      
    start: ->
      data = {}
      name = @el.querySelector('.bettor-name').value
      return this if not name
      data.name = name
      data.horses = @horses
      
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
      return this
      
    decrease: (event) ->
      @stopAndPrevent event
      horse = event.currentTarget.parentElement.parentElement
      name = horse.getAttribute 'data-name'
      amount = horse.querySelector "[name=#{name}]"
      bet = amount.value
      bet = parseInt(bet, 10) - 1
      if bet > -1 then @trigger 'decrease'
      if bet < 0 then bet = 0
      amount.value = bet
      horse.querySelector('.bet-amount').textContent = "$#{bet}"
      return this
      
    increaseTotal: ->
      total = @el.querySelector '[name="bettor-total"]'
      amount = total.value
      amount = parseInt(amount, 10) + 1
      total.value = amount
      @el.querySelector('.total-bet').textContent = "$#{amount}"
      return this
      
    decreaseTotal: ->
      total = @el.querySelector '[name="bettor-total"]'
      amount = total.value
      amount = parseInt(amount, 10) - 1
      if amount < 0 then amount = 0
      total.value = amount
      @el.querySelector('.total-bet').textContent = "$#{amount}"
      return this
      
    finish: (event) ->
      @stopAndPrevent event
      
      console.log 'finish'
      return this
      
      
    stopAndPrevent: (event) ->
      event.preventDefault()
      event.stopPropagation()
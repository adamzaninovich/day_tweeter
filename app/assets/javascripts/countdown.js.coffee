jQuery ->
  if $('.countdown').length > 0
    el = $('.countdown').first()
    countdown = ->
      seconds = parseInt el.text()
      seconds -= 1
      el.text "#{seconds}"
      if seconds <= 0
        $('.flash.alert').alert('close')
      else
        setTimeout countdown, 1000
    
    countdown()

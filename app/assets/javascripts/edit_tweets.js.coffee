jQuery ->
  $('.edit-tweet').click ->
    $(this).tooltip('hide')
    thisCell = $(this).closest('td')
    previousCell = thisCell.prev('td')
    
    # thisCell.css(background:'red')
    # previousCell.css(background:'green')
    
    thisCell.hide()
    previousCell.attr('colspan', 2)
    previousCell.find('.tweet-body').hide()
    previousCell.find('.tweet-edit').css(display:'inline-block')
    return false
  
  $('.cancel-edit').click ->
    $(this).tooltip('hide')
    thisCell = $(this).closest('td')
    nextCell = thisCell.next('td')
    
    # thisCell.css(background:'green')
    # nextCell.css(background:'red')
    
    thisCell.find('.tweet-edit').hide()
    thisCell.find('.tweet-body').css(display:'inline-block')
    thisCell.attr('colspan', 1)
    nextCell.show()
    return false
  

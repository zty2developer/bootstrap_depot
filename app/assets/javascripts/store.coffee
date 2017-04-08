# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', -> 
  $('.book_category-ele_link').bind 'click', ->
    $(this).addClass 'category_selected'
    $(this).parent().siblings().children().removeClass 'category_selected'
    return
  return

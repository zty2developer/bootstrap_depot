$ ->
	$(".notice").slideDown()
	setTimeout notice_hide, 5000

notice_hide = ->
	$(".notice").slideUp()

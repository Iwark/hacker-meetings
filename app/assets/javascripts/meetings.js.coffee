//= require marked

$( () ->
	$(".preview").html marked($(".meeting_body").val())
	$("textarea.meeting_body").on 'keyup', () ->
		$(".preview").html marked($("textarea.meeting_body").val())
		return

	$("div.meeting_body").html marked($("div.meeting_body").text())


);

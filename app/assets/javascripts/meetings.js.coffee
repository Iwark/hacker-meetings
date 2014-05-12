//= require marked

$( () ->

	marked.setOptions
		breaks: true
		sanitize: true

	if $(".preview").size() > 0
		$(".preview").html marked($(".meeting_body").val())
	if $("textarea.meeting_body").size() > 0
		$("textarea.meeting_body").on 'keyup', () ->
			$(".preview").html marked($("textarea.meeting_body").val())
			return

	if $("div.meeting_body").size() > 0
		$("div.meeting_body").html marked($("div.meeting_body").text())


);

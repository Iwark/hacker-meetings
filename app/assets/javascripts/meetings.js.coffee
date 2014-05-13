//= require marked

$( () ->

	marked.setOptions
		breaks: true
		sanitize: true
		langPrefix: ''

	mark = (target, val) ->
		$(target).html marked(val)
		$('pre code').each (i, e) ->
				hljs.highlightBlock(e)

	if $(".preview").size() > 0
		mark(".preview", $(".meeting_body").val())
	if $("textarea.meeting_body").size() > 0
		$("textarea.meeting_body").on 'keyup', () ->
			mark(".preview", $("textarea.meeting_body").val())
			return

	if $("div.meeting_body").size() > 0
		mark("div.meeting_body", $("div.meeting_body").text())


);

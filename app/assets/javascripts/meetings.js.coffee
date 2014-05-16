//= require marked

$( () ->

	$(".meetings .meeting").click (e) ->
		window.location.href = "/meetings/" + $(this).attr("meeting-id")

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
		if $("textarea.meeting_body").val() == ""
			$("textarea.meeting_body").val("## 概要\nイベントを開催します。\n\n## 参加条件\n誰でもOK！")
		$("textarea.meeting_body").on 'keyup', () ->
			mark(".preview", $("textarea.meeting_body").val())
			return

	if $("div.meeting_body").size() > 0
		mark("div.meeting_body", $("div.meeting_body").text())


);

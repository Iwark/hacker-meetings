//= require marked

$( () ->
	$(".preview").html marked($(".meeting_body").val())
	$(".meeting_body").on 'keyup', () ->
		$(".preview").html marked($(".meeting_body").val())
		return



);

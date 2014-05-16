// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require highlight_js/highlight.pack
//= require_tree .

// Google Analytics
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
ga('create', 'UA-51061610-1', 'hacker-meetings.com');
ga('send', 'pageview');

$(function(){

  $(".link-new-meeting").click(function(e){
    window.location.href = "/meetings/new";
  });

  $(".menu-button").click(function(e) {
    e.preventDefault();
    $(".navbar").toggleClass("active");
    $(".sidebar").toggleClass("active");
    $(".main").toggleClass("active");
  });

  $(".making").click(function(e) {
    alert("このコンテンツは準備中です。実装されるまでしばらくお待ちください。");
  });

  $(".meetings-path").click(function(e) {
  	window.location.href = '/meetings';
  });

  $(".users-edit-path").click(function(e) {
    window.location.href = '/users/edit';
  });

});

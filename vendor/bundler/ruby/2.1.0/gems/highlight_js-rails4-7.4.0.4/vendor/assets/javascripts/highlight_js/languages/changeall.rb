
#Dir.glob("/home/leej/r4blog.rails/vendor/highlight_js-rails4/vendor/assets/javascripts/highlight_js/languages/") do | f |
Dir.glob("**/*.js") do | file |
  base = file.split(".")[0]
  `sed -i "s/function(hljs)/hljs.LANGUAGES['#{base}'] = function(hljs)/g" #{file}`

end

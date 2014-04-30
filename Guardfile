# guard-coffeescript
guard 'coffeescript',
  :input => 'assets/coffee',
  :output => 'public/js',
  :all_on_start => true,
  :error_to_js => true

# guard-compass
guard 'compass',
  :compile_on_start => true

# Guard::EJS
guard 'ejs',
  :input => 'assets/templates',
  :output => 'public/js/templates.js'

# guard-livereload
guard 'livereload' do
  watch %r{public/(?:css|js)/.+\.(?:css|js)}
  watch %r{public/.*\.html}
end

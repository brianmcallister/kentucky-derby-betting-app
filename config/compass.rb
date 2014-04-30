require 'susy'

http_path  = '/'
asset_path = 'assets'
compile_path = 'public'

sass_dir        = "#{asset_path}/sass"

css_dir         = "#{compile_path}/css"
images_dir      = "#{compile_path}/img"
javascripts_dir = "#{compile_path}/js"
fonts_dir       = "#{compile_path}/fonts"

output_style = (environment == :production) ? :compressed : :expanded
relative_assets = true
# Set folders to assets
set :css_dir,     'css'
set :js_dir,      'js'
set :images_dir,  'images'
set :fonts_dir,   'fonts'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# page "/path/to/file.html", :layout => false

# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  # Create Livereload
  activate :livereload
  
  # Create pretty urls
  activate :directory_indexes

  # Middleman autoprefixer
  activate :autoprefixer
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Set active states navigation
helpers do
  def nav_active(path)
    current_page.path == path ? {:class => "active"} : {}
  end
end

# i18n
activate :i18n

#URLS
activate :sprockets


# Build-specific configuration
configure :build do
  # Activate minify HTML
  #activate :minify_html

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  #Gzip compression
  #activate :gzip

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

after_configuration do
  # Bower files
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  @bower_path = File.join root, @bower_config["directory"]
  sprockets.append_path @bower_path
end
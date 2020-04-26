source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

gem 'adminos', github: 'Molinos/adminos', branch: 'update/rails-6'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry' # from adminos
  gem 'shoulda-matchers' # from adminos
  gem 'bundler-audit', '~> 0.6.1' # from adminos
  gem 'database_cleaner' # from adminos
  gem 'factory_bot_rails' # from adminos
  gem 'faker' # from adminos
  gem 'minitest' # from adminos
  gem 'rspec-rails' # from adminos
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', require: false # from adminos
  gem 'capistrano-bundler', require: false # from adminos
  gem 'capistrano-rails', require: false # from adminos
  gem 'capistrano-rvm', require: false # from adminos
  gem 'capistrano3-puma' # from adminos
  gem 'capistrano-systemd-multiservice', '~> 0.1.0.beta6', require: false # from adminos
  gem 'guard' # from adminos
  gem 'guard-livereload', '~> 2.5', require: false # from adminos
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'role_model' # from adminos
gem 'image_processing', '~> 1.2' # for Active Storage variants # from adminos
gem 'whenever', require: false # from adminos
gem 'capistrano-db-tasks', require: false # from adminos
gem 'sanitize' # from adminos
gem 'mini_magick' # from adminos
gem 'paper_trail' # from adminos
gem 'postal-rails', '~> 1.0' # from adminos
gem 'scoped_search' # from adminos
gem 'pg_search' # from adminos
gem 'omniauth' # from adminos
gem 'omniauth-facebook' # from adminos
gem 'omniauth-twitter' # from adminos
gem 'omniauth-vkontakte' # from adminos
gem 'axlsx', git: 'https://github.com/randym/axlsx.git' # from adminos
gem 'spreadsheet_architect' # from adminos

group :lint do
  gem 'rubocop' # from adminos
end

gem 'mobility' # from adminos
gem 'mobility-ransack', '~> 0.2.2' # from adminos
gem 'devise-i18n' # from adminos
gem 'kaminari-i18n' # from adminos
gem 'rails-i18n' # from adminos
gem 'tolk' # from adminos
gem 'enumerize'

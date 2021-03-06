require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require File.expand_path("../lib/extensions/scoped_search_definition_ruby_3_fix.rb", __dir__)

module Evo
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.time_zone = 'Moscow'
    config.i18n.available_locales = [:ru]
    config.generators { |g| g.test_framework :rspec }
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.load_defaults 6.0
  end
end

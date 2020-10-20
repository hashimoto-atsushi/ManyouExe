require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ManyouExe
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = "Asia/Tokyo"
  end
end

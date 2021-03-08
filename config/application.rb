require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module VisitDay
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    Rails.application.configure do    
      # custom configuration section
      config.x.days = ["March 11, 2021", "March 12, 2021"].map { |d| Date.parse d }
      config.x.start_time = Time.parse "6:00 AM"
    end
  end
end

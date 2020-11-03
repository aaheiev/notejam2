require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Notejam2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

if ENV['DOCKER_LOGS']
  fd = IO.sysopen("/proc/1/fd/1","w")
  io = IO.new(fd,"w")
  io.sync = true
  NOTEJAM_LOG_OUTPUT = io
else
  NOTEJAM_LOG_OUTPUT = $stdout
end

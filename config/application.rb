require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module KingOfMountain
  class Application < Rails::Application
    config.load_defaults 5.1
    # config.i18n.available_locales = [:ru, :en]
    # config.i18n.default_locale = :ru
  end
end

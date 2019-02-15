require 'request_store_rails/sidekiq/version'

require 'sidekiq'
require_relative 'sidekiq/server_middleware'
require_relative 'sidekiq/railtie' if defined?(::Rails::Railtie)

module RequestStoreRails
  module Sidekiq
    def self.add_custom_middleware!
      ::Sidekiq.configure_server do |config|
        config.server_middleware do |chain|
          chain.add ServerMiddleware
        end
      end
    end
  end
end

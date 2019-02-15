require_relative '../sidekiq'

module RequestStoreRails
  module Sidekiq
    class Railtie < ::Rails::Railtie
      initializer 'request_store_rails-sidekiq.insert_middleware' do
        Sidekiq.add_custom_middleware!
      end
    end
  end
end

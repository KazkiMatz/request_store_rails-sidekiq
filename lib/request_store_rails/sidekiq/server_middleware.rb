require 'request_store_rails'

module RequestStoreRails
  module Sidekiq
    class ServerMiddleware
      def call(_worker, job_hash, _queue)
        Thread.current[::RequestLocals::REQUEST_STORE_ID] = job_hash['jid']
        yield
      ensure
        ::RequestLocals.clear!
        Thread.current[::RequestLocals::REQUEST_STORE_ID] = nil
      end
    end
  end
end

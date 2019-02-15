require 'request_store_rails'

module RequestStoreRails
  module Sidekiq
    class ServerMiddleware
      def call(_worker, job_hash, _queue)
        Thread.current[:request_id] = job_hash['jid']
        yield
      ensure
        ::RequestLocals.clear!
        Thread.current[:request_id] = nil
      end
    end
  end
end

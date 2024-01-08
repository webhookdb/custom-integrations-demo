# frozen_string_literal: true

require "webhookdb/async/job"

class Webhookdb::Jobs::ExamplePubsubJob
  extend Webhookdb::Async::Job

  on "webhookdb.customer.created"

  def _perform(event)
    # See sidekiq-amigo for more details on pubsub.
    c = self.lookup_model(Webhookdb::Customer, event)
    c.update(name: 'Updated')
  end
end

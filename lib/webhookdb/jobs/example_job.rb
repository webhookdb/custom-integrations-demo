# frozen_string_literal: true

require "webhookdb/async/job"

class Webhookdb::Jobs::ExampleJob
  extend Webhookdb::Async::Job

  def perform
    # You can use normal Sidekiq job style here.
    # See other jobs for more examples.
  end
end

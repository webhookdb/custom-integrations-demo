# frozen_string_literal: true

require "webhookdb/async/scheduled_job"
require "webhookdb/jobs"

class Webhookdb::Jobs::ExampleScheduledJob
  extend Webhookdb::Async::ScheduledJob

  cron '30 * * * *'
  splay 10.seconds

  def _perform
    # Run the job (note that you should override _perform, not perform).
  end
end

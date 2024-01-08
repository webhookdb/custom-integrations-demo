# frozen_string_literal: true

require "webhookdb/async"
require "webhookdb/messages/specs"

RSpec.describe "webhookdb async jobs", :async, :db, :do_not_defer_events, :no_transaction_check do
  before(:all) do
    Webhookdb::Async.setup_tests
    Sidekiq::Testing.inline!
  end

  describe "ExampleJob" do
    it "noops" do
      expect { Webhookdb::Jobs::ExampleJob.new.perform }.to_not raise_error
    end
  end

  describe "ExampleScheduledJob" do
    it "noops" do
      expect { Webhookdb::Jobs::ExampleScheduledJob.new.perform }.to_not raise_error
    end
  end

  describe "ExamplePubsubJob" do
    it "updates the created customer" do
      c = nil
      expect do
        c = Webhookdb::Fixtures.customer.create
      end.to perform_async_job(Webhookdb::Jobs::ExamplePubsubJob)
      expect(c.refresh).to have_attributes(name: 'Updated')
    end
  end
end

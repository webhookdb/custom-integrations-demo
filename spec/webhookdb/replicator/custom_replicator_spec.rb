# frozen_string_literal: true

require "webhookdb/spec_helpers/shared_examples_for_replicators"

RSpec.describe Webhookdb::Replicator::CustomReplicator, :db do
  let(:sint) do
    Webhookdb::Fixtures.service_integration.create(service_name: "custom_replicator")
  end
  let(:svc) { sint.replicator }

  it_behaves_like "a replicator", "custom_replicator" do
    let(:body) do
      JSON.parse(<<~JSON)
        {
          "external_id":"abc",
          "at": "2023-01-12T12:00:00Z"
        }
      JSON
    end
    let(:supports_row_diff) { false }
  end
end

# frozen_string_literal: true

require 'webhookdb/replicator'

class Webhookdb::Replicator::CustomReplicator < Webhookdb::Replicator::Base
  # @return [Webhookdb::Replicator::Descriptor]
  def self.descriptor
    return Webhookdb::Replicator::Descriptor.new(
      name: "custom_replicator",
      ctor: self,
      feature_roles: [],
      resource_name_singular: "Custom Resource",
      supports_webhooks: true,
    )
  end

  # See docs on the superclass for more details.
  def _remote_key_column
    return Webhookdb::Replicator::Column.new(:external_id, TEXT)
  end

  # See docs on the superclass for more details.
  def _denormalized_columns
    return [
      Webhookdb::Replicator::Column.new(:at, TIMESTAMP),
    ]
  end

  def _update_where_expr
    # Always update the row.
    # # See docs on the superclass for more details.
    # See other replicators for more usage.
    return Sequel[true]
  end

  # See docs on the superclass for more details.
  def _timestamp_column_name = :at

  def _resource_and_event(request)
    # See docs on the superclass for more details.
    return request.body, nil
  end

  # See docs on the superclass for more details.
  # See other replicators for more usage.
  def _webhook_response(request)
    return Webhookdb::WebhookResponse.ok
  end

  # See docs on the superclass for more details.
  # See other replicators for more usage.
  def calculate_webhook_state_machine
    step = Webhookdb::Replicator::StateMachineStep.new
    step.output = "ok!"
    return step.completed
  end
end

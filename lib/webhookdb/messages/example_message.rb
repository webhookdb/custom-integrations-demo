# frozen_string_literal: true

require "webhookdb/message/template"

class Webhookdb::Messages::ExampleMessage < Webhookdb::Message::Template
  def self.fixtured(_recipient)
    sint = Webhookdb::Fixtures.service_integration.create
    return self.new(sint)
  end

  def initialize(service_integration)
    @service_integration = service_integration
    super()
  end

  def template_path(transport)
    # It's easiest to override this
    return Pathname(__FILE__).dirname.dirname.dirname.dirname + "data/messages/templates/example_message.#{transport}.liquid"
  end
  # def template_name = 'if_we_do_not_match'

  def liquid_drops
    return super.merge(
      service_name: @service_integration.service_name,
    )
  end
end

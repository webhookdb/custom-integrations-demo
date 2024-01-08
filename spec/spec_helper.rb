# frozen_string_literal: true

require "appydays/dotenviable"
Appydays::Dotenviable.load(default_rack_env: "test")

require "rspec"
require "appydays/spec_helpers"
require "appydays/configurable/spec_helpers"
require "appydays/loggable/spec_helpers"

require "webhookdb"
require "webhookdb/spec_helpers"
require "webhookdb/spec_helpers/postgres"
require "webhookdb/fixtures"

Webhookdb.load_app
Webhookdb::Fixtures.load_all

RSpec.configure do |config|
  config.include(Appydays::SpecHelpers)
  config.include(Appydays::Configurable::SpecHelpers)
  config.include(Appydays::Loggable::SpecHelpers)

  require "amigo/spec_helpers"
  config.include(Amigo::SpecHelpers)

  config.include(Webhookdb::SpecHelpers)
  require "webhookdb/spec_helpers/async"
  config.include(Webhookdb::SpecHelpers::Async)
  require "webhookdb/spec_helpers/message"
  config.include(Webhookdb::SpecHelpers::Message)
  config.include(Webhookdb::SpecHelpers::Postgres)
  require "webhookdb/spec_helpers/service"
  config.include(Webhookdb::SpecHelpers::Service)
  require "webhookdb/spec_helpers/whdb"
  config.include(Webhookdb::SpecHelpers::Whdb)
end

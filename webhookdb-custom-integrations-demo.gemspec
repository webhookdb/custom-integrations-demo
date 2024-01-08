# frozen_string_literal: true

require_relative "lib/webhookdb/custom_integrations_demo"

Gem::Specification.new do |s|
  s.name = "webhookdb-custom-integrations-demo"
  s.version = Webhookdb::CustomIntegrationsDemo::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = "WebhookDB"
  s.homepage = "https://github.com/webhookdb/custom-integrations-demo"
  s.summary = "See https://docs.webhookdb.com/guides/custom-integrations/ for more info."
  s.licenses = "Apache 2.0"
  s.required_ruby_version = ">= 3.2.0"
  s.metadata["rubygems_mfa_required"] = "true"
  s.files = Dir["lib/**/*.rb"]
  s.files += Dir["data/**/*"]

  s.add_dependency("webhookdb")
end

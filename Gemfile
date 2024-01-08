# frozen_string_literal: true

source "https://rubygems.org"
ruby "3.2.1"

group :test do
  # gem 'webhookdb', git: "https://github.com/webhookdb/webhookdb.git", ref: "main"
  # These imports are REQUIRED if you are writing tests using WebhookDB.
  # This is because files in `lib/webhookdb` require these, but those files are only meant to
  # be used when webhookdb is imported as a gem, for testing like this.
  # So they are not normal webhookdb dependencies.
  gem "faker", "~> 3.2"
  gem "fluent_fixtures", "~> 0.11"
  gem "rspec", "~> 3.12"
end

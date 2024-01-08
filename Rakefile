# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "appydays/dotenviable"
Appydays::Dotenviable.load

require "webhookdb/tasks/db"
Webhookdb::Tasks::DB.new
require "webhookdb/tasks/message"
Webhookdb::Tasks::Message.new

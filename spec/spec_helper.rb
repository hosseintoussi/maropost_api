$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "maropost_api"
require "VCR"

TOKEN = "TOKEN".freeze
ACCOUNT_ID = "ACCOUNT_ID".freeze

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = "spec/cassettes"
  c.configure_rspec_metadata!
  c.filter_sensitive_data("TOKEN") { TOKEN }
  c.filter_sensitive_data("ACCOUNT_ID") { ACCOUNT_ID }
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'maropost_api'
require 'vcr'

AUTH_TOKEN = 'insert_your_auth_token'.freeze
ACCOUNT_NUMBER = 'insert_your_account_number'.freeze

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/cassettes'
  c.configure_rspec_metadata!
end

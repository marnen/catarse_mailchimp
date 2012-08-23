require 'catarse_mailchimp'
require 'supermodel'

RSpec.configure do |config|
  config.mock_with :mocha
end

MAILCHIMP_LIST_ID = '123'
MAILCHIMP_API_KEY = '123'

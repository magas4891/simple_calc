# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.start
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end

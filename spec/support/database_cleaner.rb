# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:all) do
    DatabaseCleaner.start
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  config.after(:all) do
    DatabaseCleaner.clean
  end
end

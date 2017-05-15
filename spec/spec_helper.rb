require("rspec")
require("pg")
require("sinatra/activerecord")
require("store")
require("brand")
RSpec.configure do |config|
  config.after(:each) do
    Store.all().each() do |store|
      store.destroy()
    end
  end
end

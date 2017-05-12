require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  erb(:index)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores_page)
end

post("/stores") do
  @stores = Store.all()
  store_name = params.fetch("store_name")
  Store.create({:store_name => store_name})
  erb(:stores_page)
end

get("/stores/:id")do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store_info)
end

patch("/stores/:id") do
  store_name = params.fetch('store_name')
  @store = Store.find(params.fetch("id").to_i)
  @store = Store.update(:store_name => store_name)
  erb(:store_info)
end

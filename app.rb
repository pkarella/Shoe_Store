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
   @store= Store.create({:store_name => store_name})
redirect("/stores")
end

get ("/brands")do
  @brands = Brand.all()
  erb(:brands_page)
end

post("/brands") do
  @brands = Brand.all()
  shoe_name = params.fetch("shoe_name")
  @store = Store.create({:shoe_name => shoe_name})
  redirect("/brands")
end

get("/stores/:id/edit")do
  @store = Store.find(params.fetch("id").to_i())
  erb(:store_edit)
end

get("/stores/:id")do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:brands_page)
end

post("/brands")do
  shoe_name = params.fetch("shoe_name")
  store_id = params.fetch("store_id").to_i()
  @store = Store.find(store_id)
  @brand = Brand.create({:shoe_name => shoe_name, :store_id => store_id})
  @brands = Brand.all()
  erb(:brands_page)
end


patch("/stores/:id/edit") do
  @store = Store.find(params.fetch("id").to_i())
  store_name = params.fetch("store_name")
  @store.update({:store_name => store_name})
  @stores = Store.all()
  erb(:store_info)
end




delete("/stores/:id/edit") do
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @stores = Store.all()
  erb(:stores_page)
end

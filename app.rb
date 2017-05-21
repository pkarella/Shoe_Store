require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('./lib/brand')
require('./lib/store')
require('./lib/price')

get("/") do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/brands") do
  shoe_name = params.fetch("shoe_name")
  brand = Brand.create({:shoe_name => shoe_name})
  @brands = Brand.all()
  erb(:brands)
end

post("/stores") do
  store_name = params.fetch("store_name")
  store = Store.create({:store_name => store_name})
  @stores = Store.all()
  erb(:stores)
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all()
  @brands = Brand.all()
  erb(:brands_info)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  @stores = Store.all()
  erb(:store_info)
end

patch("/brands/:id") do
  brand_id = params.fetch("id").to_i()
  @brand = Brand.find(brand_id)
  store_ids = params.fetch("store_ids")
  @brand.update({:store_ids => store_ids})
  @stores = Store.all()
  erb(:brands_info)
end

delete("/brands/:id") do
  @brands = Brand.all()
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.delete()
  @stores = Store.all()
  erb(:brands)
end


patch("/stores/:id") do
  store_id = params.fetch("id").to_i()
  @store = Store.find(store_id)
  brand_ids = params.fetch("brand_ids")
  @store.update({:brand_ids => brand_ids})
  @brands = Brand.all()
  erb(:store_info)
end
delete("/stores/:id") do
  @stores = Store.all()
  @store = Store.find(params.fetch("id").to_i())
  @store.delete()
  @brands = Brand.all()
  erb(:stores)
end

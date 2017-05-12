require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

DATABASE_URL="postgres://localhost/footwear_development"

get '/' do
  erb :index
end

# brand pages
get '/brands' do
  @brands = Brand.all
  erb :brands
end

post '/brands' do
  Brand.create(:name => params['name'], :cost => params['cost'])
  redirect '/brands'
end

get '/brand/:id' do
  @stores = Store.all
  @brand = Brand.find(params['id'].to_i)
  erb :brand
end

post '/brand/:id' do
  @brand = Brand.find(params['id'].to_i)
  @brand.update(:store_ids => params['stores_id'])
  @stores = Store.all
  redirect "/brand/#{@brand.id}"
end

patch '/brand/:id' do
  name = params['name']
  cost = params['cost']
  @brand = Brand.find(params['id'].to_i)
  if (name.split('').any?)
    @brand.update({:name => name, :cost => cost})
  else
    @brand.update({:name => "#{@brand.name}", :cost => "#{@brand.cost}"})
  end
  redirect '/brands'
end

delete '/brand/:id' do
  brand = Brand.find(params['id'].to_i)
  brand.delete
  redirect '/brands'
end

# store pages
get '/stores' do
  @stores = Store.all
  erb :stores
end

post '/stores' do
  Store.create(:name => params['name'])
  redirect '/stores'
end

get '/store/:id' do
  @brands = Brand.all
  @store = Store.find(params['id'].to_i)
  erb :store
end

post '/store/:id' do
  @store = Store.find(params['id'].to_i)
  @store.update(:brand_ids => params['brands_id'])
  @brands = Brand.all
  redirect "/store/#{@store.id}"
end

patch '/store/:id' do
  @store = Store.find(params['id'].to_i)
  @store.update(:name => params['name'])
  redirect '/stores'
end

delete '/store/:id' do
  store = Store.find(params['id'].to_i)
  store.delete
  redirect '/stores'
end

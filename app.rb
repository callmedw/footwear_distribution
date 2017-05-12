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
  Brand.create(:name => params['name'])
  redirect '/brands'
end

get '/brand/:id' do
  @brand = Brand.find(params['id'].to_i)
  erb :brand
end

patch '/brand/:id' do
  @brand = Brand.find(params['id'].to_i)
  @brand.update(:name => params['name'])
  redirect '/brands'
end

delete '/brand/:id' do
  brand = Brand.find(params['id'].to_i)
  brand.delete
  redirect '/brands'
end

# store pages
get '/stores' do
  @stores=Store.all
  erb :stores
end

post '/stores' do
  Store.create(:name => params['name'])
  redirect '/stores'
end

get '/store/:id' do
  @store = Store.find(params['id'].to_i)
  erb :store
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

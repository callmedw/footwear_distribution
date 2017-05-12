require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

DATABASE_URL="postgres://localhost/footwear_development"

get '/' do
  erb :index
end

get '/brands' do
  @brands=Brand.all
  @stores = Store.all
  erb :brands
end

get '/stores' do
  @stores=Store.all
  @brands = Brand.all
  erb :stores
end

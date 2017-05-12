require "bundler/setup"
Bundler.require :default
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

DATABASE_URL="postgres://localhost/footwear_development"

get '/' do
  @stores=Store.all
  @brands = Brand.all
  erb :index
end

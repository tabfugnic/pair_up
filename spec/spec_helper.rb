require 'bundler'
require 'webmock/rspec'
Bundler.require(:default, :development)


Dir[File.expand_path('../support/**/*.rb', __FILE__)].each do |path|
  require path
end


RSpec.configure do |config|
  config.order = 'random'
end

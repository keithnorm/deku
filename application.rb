require 'rubygems'
require 'sinatra'
require_relative 'environment'


configure do
  set :views, "#{File.dirname(__FILE__)}/views"
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  # add your helpers here
end

get '/' do
  haml :index
end

get '/search' do
  haml :search
end

get '/signup' do
  haml 'users/new'.to_sym
end

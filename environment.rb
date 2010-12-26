require 'rubygems'
require 'compass'
require 'haml'
require 'ostruct'
require 'sass/plugin/rack'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Deku',
                 :author => '',
                 :url_base => 'http://localhost:4567/'
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }

  Sass::Plugin.add_template_location('public/css/sass', 'public/css')
  Sass::Plugin.options[:load_paths] = ['public/css/sass']

end

use Sass::Plugin::Rack

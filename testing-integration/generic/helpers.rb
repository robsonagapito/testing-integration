require 'pry'
require 'rubygems'
require 'rspec'
require "json"
require 'open-uri'
require 'openssl'
require 'yaml'
require 'net/http'
require 'rest-client'

require File.dirname(__FILE__) + '/color_name.rb'

module Helpers

  def decode(value, replace)
    value.gsub!("***", replace)
  end
  
end


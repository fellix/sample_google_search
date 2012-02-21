require 'bundler/setup'
Bundler.require :default
require 'active_record'
require "addressable/uri"
require_relative 'search'
require_relative 'keyword_parser'
require_relative 'google/item'
require_relative 'models/search_item'

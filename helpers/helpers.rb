require 'sinatra/base'
require 'json'

module Sinatra
  module Helpers
    def slugify(stuff)
      stuff.gsub! /\s+/, '-'
      stuff.gsub /\-{2}/, '-'
    end
  end
  helpers Helpers
end

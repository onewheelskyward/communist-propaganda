require 'sinatra/base'
require 'json'

module Sinatra
  module Helpers
    def slugify(stuff)
      stuff.gsub! /\s+/, '-'
      stuff.gsub /\-{2}/, '-'
    end

    def generate_uri
      noun = Propaganda.all(type: :noun).sample
      noun2 = Propaganda.all(type: :noun).sample
      filler = Propaganda.all(type: :filler).sample
      verb = Propaganda.all(type: :verb).sample
      slugify "#{noun.word.downcase}-#{verb.word.downcase}-#{filler.word.downcase}-#{noun2.word.downcase}-#{/\w{5,10}/.gen}"
    end
  end
  helpers Helpers
end

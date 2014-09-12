require 'randexp'

class App < Sinatra::Base
	def create_bolshevik(body)
    params = JSON.parse body
    uri = Shortening.create(bourgeois: params[:bourgeois])
    uri.bolshevik = generate_uri
    uri.save
    uri
  end

  def generate_uri
    #Todo: make unique
    noun = Propaganda.all(type: :noun).sample
    noun2 = Propaganda.all(type: :noun).sample
    filler = Propaganda.all(type: :filler).sample
    verb = Propaganda.all(type: :verb).sample
    slugify "#{noun.word.downcase}-#{verb.word.downcase}-#{filler.word.downcase}-#{noun2.word.downcase}-#{/\w{5,10}/.gen}"
  end
end

require 'randexp'

class App < Sinatra::Base
  def create_bolshevik(body)
    params = JSON.parse body
    uri = Shortening.create(bourgeois: params[:bourgeois])
    uri.bolshevik = generate_uri
    uri.save
    uri
  end
end

class App < Sinatra::Base
	def create_bolshevik(body)
    params = JSON.parse body
    uri = Shortening.create(bourgeois: params[:bourgeois])
    uri.bolshevik = 'jstal.in'
    uri.save
    uri
  end
end

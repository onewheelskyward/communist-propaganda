class App < Sinatra::Base
  get '/' do
    erb :basic, :locals => {local_erb_var: 'xyz'}
  end

  post '/shortening' do
    uri = create_bolshevik request.body.read
    status 201
    uri.to_json
  end

  get '/view' do
    erb :basic, :locals => {local_erb_var: 'xyz'}
  end

  # This one should remain at the end since it's a catch-all.
  get '/:propaganda' do
    shortening = resolve_bolshevik params[:propaganda]
    if shortening
      redirect shortening.bourgeois, 302
    else
      status 404
    end
  end
end

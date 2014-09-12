class App < Sinatra::Base
  get '/' do
    erb :basic, :locals => {local_erb_var: 'xyz'}
  end

  post '/shortening' do
    uri = create_bolshevik request.body.read
    status 201
    uri.to_json
  end

  get '/:propaganda' do
    uri = resolve_bolshevik params[:propaganda]
    redirect uri.bourgeois, 302
  end

  get '/view' do
    erb :basic, :locals => {local_erb_var: 'xyz'}
  end
end

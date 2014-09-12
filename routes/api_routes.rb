class App < Sinatra::Base
  get '/' do
    get_something
    erb :basic, :locals => {local_erb_var: 'xyz'}
  end

  post '/shortening' do
    uri = create_bolshevik request.body.read
    status 201
    uri.to_json
  end
end

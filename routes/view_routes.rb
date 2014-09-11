class App < Sinatra::Base
	get '/view' do
		get_something
		erb :basic, :locals => {local_erb_var: 'xyz'}
	end
end

describe 'api tests' do
  include Rack::Test::Methods
	it 'will run get_something and return for nothing' do
		get '/'
		expect(last_response.body).to eq "You are here.\n"
  end

  it 'creates a url and returns the jstal.in.' do
    post '/shortening', {bourgeois: 'http://yo.yo'}.to_json
    expect(last_response.status).to eq(201)
    bod = JSON.parse last_response.body
    expect(bod['bolshevik']).to eq('jstal.in')
  end
end

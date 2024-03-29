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
    expect(bod['bolshevik']).to match(/\w+\-\w+\-\w+\-/)
  end

  it 'generates a uri' do
    expect(generate_uri).to match(/[\w-]+/)
  end

  it 'slugifies' do
    expect(slugify(' -w')).to eq '-w'
  end

  it 'resolve bolshevik' do
    p = Shortening.first_or_create(bourgeois: 'http://xyz', bolshevik: 'oop')
    get '/oop'
    expect(last_response.status).to eq(302)
  end
end

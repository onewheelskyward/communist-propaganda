# require_relative 'spec_helper'
describe 'tests' do
  include Rack::Test::Methods
	it 'will run get_something and return for nothing' do
		get '/'
		expect(last_response.body).to eq "You are here.\n"
	end
end

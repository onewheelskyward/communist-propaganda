class Shortening
	include DataMapper::Resource

	property :id, Serial
	property :bourgeois, String, length: 2048
	property :bolshevik, Text, length: 2048
	property :extension, Text, length: 100
	property :created_at, DateTime
	property :updated_at, DateTime
end

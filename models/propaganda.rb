class Propaganda
  include DataMapper::Resource

  property :id, Serial
  property :type, Enum[:noun, :verb, :filler]
  property :word, String, length: 50
  property :created_at, DateTime
  property :updated_at, DateTime
end

describe 'propaganda tests' do
  it 'create propaganda' do
    p = Propaganda.create(type: :verb, word: :work)
    expect(p.word).to eq 'work'
    expect(p.type).to eq :verb
  end
end

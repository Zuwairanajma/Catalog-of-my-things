require_relative '../genre'

RSpec.describe Genre do
  let(:genre) { Genre.new(1, 'Rock') }
  let(:item) { double('item') }

  describe '#initialize' do
    it 'sets id and name correctly' do
      expect(genre.id).to eq(1)
      expect(genre.name).to eq('Rock')
    end

    it 'initializes items as an empty array' do
      expect(genre.instance_variable_get(:@items)).to be_empty
    end
  end

  describe '#add_item' do
    it 'adds an item to the genre' do
      expect(item).to receive(:add_genre=).with(genre)
      genre.add_item(item)
      expect(genre.instance_variable_get(:@items)).to include(item)
    end

    it 'does not add the same item multiple times' do
      expect(item).to receive(:add_genre=).once.with(genre)
      2.times { genre.add_item(item) }
      expect(genre.instance_variable_get(:@items).count(item)).to eq(1)
    end
  end
end

require_relative '../music_album'

RSpec.describe MusicAlbum do
  let(:published_date) { Date.new(2010, 1, 1) }
  let(:genre) { instance_double('Genre') }

  describe '#initialize' do
    it 'sets published_date, genre, title, and on_spotify correctly' do
      music_album = MusicAlbum.new(published_date, genre, title: 'Album Title', on_spotify: true)

      expect(music_album.published_date).to eq(published_date)
      expect(music_album.genre).to eq(genre)
      expect(music_album.instance_variable_get(:@title)).to eq('Album Title')
      expect(music_album.on_spotify?).to be true
    end
  end

  describe '#on_spotify?' do
    it 'returns true if the album is on Spotify' do
      music_album = MusicAlbum.new(published_date, genre, title: 'Album Title', on_spotify: true)
      expect(music_album.on_spotify?).to be true
    end

    it 'returns false if the album is not on Spotify' do
      music_album = MusicAlbum.new(published_date, genre, title: 'Album Title', on_spotify: false)
      expect(music_album.on_spotify?).to be false
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if parent class can be archived and album is on Spotify' do
      music_album = MusicAlbum.new(published_date, genre, title: 'Album Title', on_spotify: true)
      expect(music_album.send(:can_be_archived?)).to be true
    end

    it 'returns false if album is not on Spotify' do
      music_album = MusicAlbum.new(published_date, genre, title: 'Album Title', on_spotify: false)
      expect(music_album.send(:can_be_archived?)).to be false
    end
  end
end

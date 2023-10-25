require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(published_date, genre, title:, on_spotify:)
    super(published_date, genre)
    @title = title
    @on_spotify = on_spotify
  end

  def on_spotify?
    @on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end

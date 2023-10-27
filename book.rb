require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :cover_state, :publisher

  def initialize(published_date, title, author, cover_state, publisher)
    super(published_date)
    @title = title
    @author = author
    @cover_state = cover_state
    @publisher = publisher
  end

  def to_hash
    {
      published_date: @published_date,
      title: @title,
      author: @author,
      cover_state: @cover_state,
      publisher: @publisher
    }
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end

class Genre
  attr_accessor :name, :id

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    return if @items.include?(item)

    @items << item
    item.add_genre = self
  end

  def add_genre=(genre)
    @genre = genre
  end
end

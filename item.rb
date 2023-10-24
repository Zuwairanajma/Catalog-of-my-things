require 'date' # frozen_string_literal: true

class Item
  attr_reader :published_date, :genre, :label, :author

  def initialize(published_date, genre)
    @id = rand(1..1000)
    @genre = genre
    # @published_date = Date.parse(published_date)
    @published_date = published_date
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    return true if
    years_since_published_date >= 10
  end

  def years_since_published_date
    Date.today.year - @published_date.year
  end

  def label=(label)
    @label = label
    label.add_item(self)
  end
end

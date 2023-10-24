require_relative 'book' # frozen_string_literal: true
require_relative 'label' # frozen_string_literal: true
require 'json'

class App
  attr_accessor :books, :music_album,
                :games, :label, :file_name

  def initialize
    @books = []
    @music_album = []
    @games = []
    @labels = []
    @genres = []
    @game_author = []
  end

  def add_book
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Enter title'
    title = gets.chomp
    puts 'Enter author'
    author = gets.chomp
    puts 'Enter cover state'
    cover_state = gets.chomp
    puts 'Enter publisher'
    publisher = gets.chomp
    @books << Book.new(published_date, title, author, cover_state, publisher).to_hash
    hashed = @books.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('book.json', json)
    puts 'book added'
  end

  def add_label
    puts 'Enter label name'
    label_name = gets.chomp
    @labels << Label.new(label_name).to_hash
    hashed = @labels.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('label.json', json)
    puts 'label added'
  end

  def display_books
    @books = JSON.parse(File.read('book.json'))
    puts 'No books' if @books.empty?
    @books.each do |book|
      puts "published date: #{book['published_date']},
      title: #{book['title']},
       author: #{book['author']},
       cover state: #{book['cover_state']}"
    end
  end

  def display_labels
    @labels = JSON.parse(File.read('label.json'))
    puts 'No label' if @labels.empty?
    @labels.each do |label|
      puts "label name: #{label['title']}"
    end
    puts 'label displayed'
  end
end

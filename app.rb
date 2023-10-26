require_relative 'book'
require_relative 'label'
require_relative 'get_inputs'
require 'json'

class App
  include HelperMethods

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

  # def add_book
  #   puts 'Enter published date'
  #   published_date = gets.chomp
  #   puts 'Enter title'
  #   title = gets.chomp
  #   puts 'Enter author'
  #   author = gets.chomp
  #   puts 'Enter cover state'
  #   cover_state = gets.chomp
  #   puts 'Enter publisher'
  #   publisher = gets.chomp
  #   @books << Book.new(published_date, title, author, cover_state, publisher).to_hash
  #   hashed = @books.map(&:to_hash)
  #   json = JSON.generate(hashed)
  #   File.write('book.json', json)
  #   puts 'book added'
  # end

  # def add_label
  #   puts 'Enter label name'
  #   label_name = gets.chomp
  #   @labels << Label.new(label_name).to_hash
  #   hashed = @labels.map(&:to_hash)
  #   json = JSON.generate(hashed)
  #   File.write('label.json', json)
  #   puts 'label added'
  # end

  # def display_books
  #   @books = JSON.parse(File.read('book.json'))
  #   puts 'No books' if @books.empty?
  #   @books.each do |book|
  #     puts "published date: #{book['published_date']},
  #     title: #{book['title']},
  #      author: #{book['author']},
  #      cover state: #{book['cover_state']}"
  #   end
  # end

  # def display_labels
  #   @labels = JSON.parse(File.read('label.json'))
  #   puts 'No label' if @labels.empty?
  #   @labels.each do |label|
  #     puts "label name: #{label['title']}"
  #   end
  #   puts 'label displayed'
  # end
    
  # add game

  def add_game
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Is it a multi player game (yes or no)'
    multiplayer = gets.chomp
    puts 'Enter last played date'
    last_played_at = gets.chomp
    @games << Game.new(multiplayer, last_played_at, published_date).to_hash
    hashed = @games.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write('game.json', json)
    puts 'game added'
  end



     # display game

  def add_game_author
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    @game_author << { 'first_name' => first_name, 'last_name' => last_name }
    save_to_json('add_game_author.json', @game_author)
    puts 'game author added'
  end

   # display game

   def display_games
    @games = JSON.parse(File.read('game.json'))
    puts 'No games' if @games.empty?
    @games.each do |game|
      puts "published date: #{game['published_date']}", "multy player: #{game['multiplayer']}"
    end
    puts 'games displayed'
  end


  # display game authors

  def display_game_authors
    @game_author = JSON.parse(File.read('add_game_author.json'))
    puts 'No game authors' if @game_author.empty?
    @game_author.each do |game_author|
      puts "first name: #{game_author['first_name']}", "last name: #{game_author['last_name']}"
    end
    puts 'game authors displayed'
  end

  def add_book
    published_date = get_user_input('Enter published date')
    title = get_user_input('Enter title')
    author = get_user_input('Enter author')
    cover_state = get_user_input('Enter cover state')
    publisher = get_user_input('Enter publisher')

    book = Book.new(published_date, title, author, cover_state, publisher)
    @books << book.to_hash

    save_to_json('book.json', @books)
    puts 'Book added'
  end

  def add_label
    label_name = get_user_input('Enter label name')
    @labels << Label.new(label_name).to_hash

    save_to_json('label.json', @labels)
    puts 'Label added'
  end

  def display_books
    display_collection('book.json', 'No books', %w[published_date title author cover_state])
  end

  def display_labels
    display_collection('label.json', 'No labels', ['title'])
  end

      # ...

      private

      def save_to_json(file_name, collection)
        json = JSON.pretty_generate(collection)
        File.write(file_name, json)
      end
end

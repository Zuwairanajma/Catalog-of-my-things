require_relative 'book'
require_relative 'label'
require_relative 'get_inputs'
require_relative 'game'
require_relative 'genre'
require_relative 'music_album'
require_relative 'author'
require 'json'

class App
  include HelperMethods

  attr_accessor :books, :music_albums,
                :games, :label, :author, :file_name

  def initialize
    @books = []
    @music_albums = load_from_json('music_album.json') || []
    @games = []
    @labels = []
    @genres = extract_genres_from_music_albums || []
    @game_author = []
  end

  def add_book
    @books = load_from_json('book.json') || []
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
    @labels = load_from_json('label.json') || []

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

  def add_music_album
    title = get_user_input('Enter music album title')
    published_date = get_user_input('Enter published date')
    genre_name = get_user_input('Enter genre')
    on_spotify = get_user_input('Is it on Spotify? (true or false)')
    genre = find_or_create_genre(genre_name)
    existing_music_albums = load_from_json('music_album.json')
    music_album = MusicAlbum.new(published_date, genre, title: title, on_spotify: on_spotify)
    existing_music_albums << music_album.to_hash
    save_to_json('music_album.json', existing_music_albums)
    puts 'Music album added'
  end

  def display_genres
    puts 'Genres:'
    @genres.each do |genre|
      puts "ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  private

  def find_or_create_genre(name)
    existing_genre = @genres.find { |genre| genre.name == name }
    return existing_genre if existing_genre

    new_genre = Genre.new(@genres.size + 1, name)
    @genres << new_genre
    new_genre
  end

  def display_music_album
    display_collection('music_album.json', 'No music albums', %w[published_date genre title on_spotify])
  end

  def add_game
    @games = load_from_json('game.json') || []
    puts 'Enter published date'
    published_date = gets.chomp
    puts 'Is it a multi player game (yes or no)'
    multiplayer = gets.chomp
    puts 'Enter last played date'
    last_played_at = gets.chomp
    @games << Game.new(multiplayer, last_played_at, published_date).to_hash
    save_to_json('game.json', @games)
    puts 'game added'
  end

  # display game

  def add_game_author
    @game_author = load_from_json('add_game_author.json') || []
    puts 'First name'
    first_name = gets.chomp
    puts 'Last name'
    last_name = gets.chomp
    @game_author << { 'first_name' => first_name, 'last_name' => last_name }
    save_to_json('add_game_author.json', @game_author)
    puts 'game author added'
  end

  def display_games
    display_collection('game.json', 'No games', %w[published_date multiplayer last_played_at])
  end

  def display_game_authors
    display_collection('add_game_author.json', 'No game authors', %w[first_name last_name])
  end
end

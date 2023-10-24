require_relative 'item'

class Main 
    OPTIONS = {
        1 => :display_books,
        2 => :display_music_album,
        3 => :display_genres,
        4 => :display_games,
        5 => :add_book,
        6 => :add_music_album,
        7 => :add_label,
        8 => :add_game,
        9 => :add_game_author,
        10 => :display_labels,
        11 => :display_authors,
        12 => :exit
    }.freeze

    def 
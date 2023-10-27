module HelperMethods
  def get_user_input(prompt)
    puts prompt
    gets.chomp
  end

  def save_to_json(file_name, collection)
    hashed = collection.map(&:to_hash)
    json = JSON.generate(hashed)
    File.write(file_name, json)
  end

  def display_collection(file_name, empty_message, attributes)
    input_collection = load_from_json(file_name)
    puts empty_message if input_collection.empty?

    input_collection.each do |item|
      puts attributes.map { |attr| "#{attr}: #{item[attr]}" }.join(', ')
    end
  end

  def load_from_json(file_name)
    return [] unless File.exist?(file_name) && !File.empty?(file_name)

    json_data = File.read(file_name)
    JSON.parse(json_data)
  end

  def extract_genres_from_music_albums
    genre_strings = @music_albums.map { |album| album['genre'] }.uniq.compact
    genre_strings.map.with_index { |genre, index| Genre.new(index + 1, genre) }
  end
end

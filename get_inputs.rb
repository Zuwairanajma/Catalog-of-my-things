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
    input_collection = JSON.parse(File.read(file_name))
    puts empty_message if input_collection.empty?

    input_collection.each do |item|
      puts attributes.map { |attr| "#{attr}: #{item[attr]}" }.join(', ')
    end
  end
end

require 'pry'

file = File.open("History of Gaming.txt", "r")
contents = file.read.downcase

def shitty_text_maker(text_to_shittify)
  working_string = text_to_shittify.downcase
  alphabet_array = ('a'..'z').to_a
  characters_to_edit = ['?', '!']
  string_array = working_string.split('')
  array_to_return = []
  string_array.each do |character|
    alphabet_array.each do |letter|
      if character == letter
        array_to_return << ":sh#{letter.upcase}:"
      end
    end
    if character == characters_to_edit[0]
      array_to_return << ":question:"
    elsif character == characters_to_edit[1]
      array_to_return << ":exclamation:"
    else
      array_to_return << character
    end
  end
  array_to_return.each do |element|
    alphabet_array.each do |letter|
      if element == letter
        array_to_return.delete(letter)
      end
    end
  end
  string_to_return = array_to_return.join
  new_file = File.open("shit_text.txt", "w") do |stuff|
    stuff.puts string_to_return
  end
end

shitty_text_maker("shoot yourself with a coconut gun")

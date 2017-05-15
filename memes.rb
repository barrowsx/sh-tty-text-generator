require 'pry'
require 'to_words'

def shitty_text_maker(text_to_shittify)
  working_string = text_to_shittify.downcase
  alphabet_array = ('a'..'z').to_a
  characters_to_edit = ['?', '!']
  string_array = working_string.split('')
  array_to_return = []
  number_array = []
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

def convert_numbers(string)
  string_array = string.split('')
  working_string = ''
  number_array = []
  number_word_array = []
  string_to_return = ''
  string_array.each do |character|
    if character == '0' || character.to_i != 0
      working_string << character
    else
      working_string << '.'
    end
  end
  number_array = working_string.split('.')
  number_array.reject!{ |element| element.empty? }
  number_array.each do |num|
    number_word_array << num.to_words.downcase
    string_to_return = string.sub(num, num.to_words.downcase)
  end
  if string_to_return == ''
    string
  else
    string_to_return
  end
end

puts "Enter phrase you want to shittify:"
shittify = gets.chomp
shitty_text_maker(convert_numbers(shittify))

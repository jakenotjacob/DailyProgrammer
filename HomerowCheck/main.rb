#!/usr/bin/env/ruby
#
#Alien spellchecker!
#Some letters typed are shifted 1 right, or 1 left
#and need to be fixed to make sense.
#
#

def fix(word, wordlist, keys)
  lefty = shift(word, keys, "l")
  righty = shift(word, keys, "r")
  if wordlist.include? lefty
    return lefty
  elsif wordlist.include? righty
    return righty
  else
    return word
  end
end

def shift(word, keys, direction)
  final = ""
  word.each_char { |letter|
    keyrow = keys.select do |row| 
      keys.index(row) if row.include? letter
    end.join
    letter_index = keyrow.index(letter)
    case direction
    when "r"
      if letter_index == (keyrow.length-1)
        final << keyrow[0]
      else
        final << keyrow[letter_index+1]
      end
    when "l"
      final << keyrow[letter_index-1]
    end
  }
  return final
end

list = File.open "words.txt", "r+"
list = list.map { |word| word.chomp }

keys = [
  %w(q w e r t y u i o p),
  %w(a s d f g h j k l),
  %w(z x c v b n m)
  ]

puts "Enter line: "
words = gets.chomp.downcase.split(" ")

sentence = []
words.each { |word|
  if list.include? word
    sentence << word
  else
    sentence << fix(word, list, keys)
  end
}
puts sentence.join " "


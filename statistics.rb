require "naive_bayes"

system("ruby generate.rb; echo 'New Poem Is Generated'")

sleep(1)

grammar = NaiveBayes.new(:genders,
                         :nouns,
                         :adjectives,
                         :conjucation,
                         :verbs,
)

## Gender
grammar.train(:genders,  "le", "gender")
grammar.train(:genders,  "la", "gender")
grammar.train(:genders, "lez", "gender")

## Nouns
grammar.train(:nouns,  "cabine", "noun")
grammar.train(:nouns, "demeure", "noun")
grammar.train(:nouns,  "zigner", "noun")
grammar.train(:nouns,  "maizon", "noun")

## Adjectives
grammar.train(:adjectives, "braun", "adjective")
grammar.train(:adjectives,  "vert", "adjective")
grammar.train(:adjectives,  "gris", "adjective")

## Conjucations
grammar.train(:conjucation,     "es", "conjucation")
grammar.train(:conjucation,   "sont", "conjucation")
grammar.train(:conjucation, "azeoir", "conjucation")

## Verbs
grammar.train(:verbs,   "pedecise", "verb")
grammar.train(:verbs,    "oublier", "verb")
grammar.train(:verbs, "mopedecise", "verb")

new_phrase = File.readlines("_imaginedpath/random/translated.txt")

row = 0
specific_word = 0

line_iteration = new_phrase.size.to_i

line_iteration.times do
  chosen_line = new_phrase[row].split(" ")

  word_list = chosen_line.size.to_i

  word_list.times do
    result = grammar.classify(*word_list[specific_word])

    label = result[0]
    probability = result[1]
    
    second_label       = "Not #{label}:"
    second_probability = probability / 100

    puts "#{label.upcase}: #{probability} #{second_label.upcase} #{second_probability}"

    specific_word = specific_word + 1
  end

  row = row + 1
end

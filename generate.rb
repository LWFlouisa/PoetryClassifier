# Get the date.
#system("date > _date/date.txt")

# Immutables
#date             = File.read("_date/date.txt").strip.to_s
#date_title       = date.tr " ", "_"

ran_1 = rand(8) % 12
ran_2 = rand(8) % 12
ran_3 = rand(8) % 12
ran_4 = rand(8) % 12
ran_5 = rand(8) % 12
ran_6 = rand(8) % 12
ran_7 = rand(8) % 12
ran_8 = rand(8) % 12

poem1 = File.readlines("MyPoems/hafestranfolksong.txt")
poem2 = File.readlines("MyPoems/ravenrose.txt")
poem3 = File.readlines("MyPoems/seguidilladiishamisen.txt")
poem4 = File.readlines("MyPoems/selfdoubt.txt")
poem5 = File.readlines("MyPoems/anthemadiihafestra.txt")
poem6 = File.readlines("MyPoems/fromglasstograss.txt")
poem7 = File.readlines("MyPoems/midnightsunset.txt")
poem8 = File.readlines("MyPoems/disillussionmusicbox.txt")

line_1 = poem1[ran_1]
line_2 = poem2[ran_2]
line_3 = poem3[ran_3]
line_4 = poem4[ran_4]
line_5 = poem5[ran_5]
line_6 = poem6[ran_6]
line_7 = poem7[ran_7]
line_8 = poem8[ran_8]

line_list = [ line_1, line_2,
              line_3, line_4,
              line_5, line_6,
              line_7, line_8,
            ]

random_line = line_list

row = 0

iteration = random_line.size.to_i

open("_imaginedpath/random/input.txt", "w") { |f|
  #puts "## #{date_title}"

  iteration.times do
    puts random_line[row] #.strip
    f.puts random_line[row] #.strip

    row = row + 1
  end
}

system("trans :fr file://_imaginedpath/random/input.txt > _imaginedpath/random/translated.txt")

sleep(1)

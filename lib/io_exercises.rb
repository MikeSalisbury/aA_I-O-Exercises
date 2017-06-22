# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.

def guessing_game
  computer_number = rand(1..100)
  guess_count = 1
  p "Please guess a number between 1 and 100"
  guess = gets.chomp.to_i

  until guess == computer_number
    if guess > computer_number || guess > 100
      p "#{guess} is too high"
    elsif guess < computer_number || guess < 1
      p "#{guess} is too low"
    end
    p "Please guess again"
    guess = gets.chomp.to_i
    guess_count += 1
  end

  p "The correct number was #{computer_number} and it took you #{guess_count} guesses."
end

def file_shuffler
  p "Please let me know what file you have to be shuffled."
  file_name = gets.chomp
  array_file = File.readlines("#{file_name}")
  array_file.shuffle!
  shuffled_file = File.open("#{file_name}-shuffled.txt", 'w')
  array_file.each {|line| shuffled_file.puts line}
  shuffled_file.close
  p "Your file has been shuffled and saved as #{file_name}-shuffled.txt"
end

if  $0 == __FILE__
  file_shuffler
end

class Deck

  def initialize
    @card_deck_hash
    @temp_deck_hash
  end

  def add_card (word, definition) #adds to card_deck hash
  end

  def shuffle #shuffles card_deck_hash, 
    ## card_deck_hash >> array.shuffle >> temp_deck_hash
  end

  def sample_card # returns word, definition
    #if temp_deck is empty, shuffle card_deck and repopulate temp_deck
  end

end


class Controller


  def input_and_parse_file(filename) #reads in file, parses word-definition pairs
    @input_file = whatever from txt file    
  end

  def populate_deck #sends word and definition strings to Deck.add_card
    @deck_object = Deck.new
    #Deck.add_card (word-string, definition-string)
  end

  def self.control_sequence(txt_filename)
      @input_file = []
      input_and_parse_file(txt_filename)
      populate_deck
      @deck_object
  end

  # def save_to_file(filename) #outputs Cards to file
  #   #parsing
  # end

end


class GameMaster

  attr_accessor :current_word, :current_def

  def initialize(txt_file)
     @TheDeck = Controller.control_sequence(txt_file)
  end

  def run_game
    #Welcome Message
    puts "Welcome to Ruby Flash Cards. "
      sleep 0.1 
    puts "To play, just enter the correct term for each definition."
      sleep 0.1 
    puts "Ready?  Go!"
      sleep 0.1 

    keep_looping = true

    while keep_looping
      pick_a_card
      
      puts "Definition:"
      puts @current_def
        sleep 0.5

      check_guess (gets.chomp.downcase!)
        sleep 0.1
      
      puts "Ready for next flashcard? y/n"
      keep_looping = prompt_user(gets)
    end

    puts "Thanks for playing!"
    exit_game

  end

  def pick_a_card
    current_card = @TheDeck.sample_card
    @current_word = current_card.first
    @current_def = current_card.last
  end

  def check_guess (guess, current_word)
    guess_count = 1
    while true
      puts "Guess ##{guess_count}:"
      if guess == @current_word
        puts "Correct!"
        puts "You got it in #{guess} guess!"
      elsif guess == "quit" || "exit" || "q" ||
        break
      else 
        puts "Wrong answer."
      end
    end
  end

  def prompt_user (input.downocase!)
      true if input == "\r" || "y" || "yes"
      false if input == "n" || "no"
      exit_game if input == "quit" || "exit" || "q"
      puts "Dude, type 'y' to continue:"
      prompt_user(gets)
  end

  def exit_game
    #Controller.save
  end

end

GameMaster.new('flashcards.txt')



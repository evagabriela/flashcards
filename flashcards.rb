class Deck

  def initialize
    @card_deck = {}
    @temp_deck = []
  end

  def add_card(word, definition) #adds to card_deck hash
    @card_deck[word] = definition
  end

  def shuffle #shuffles card_deck and stores in temp_deck array
    @temp_deck = @card_deck.to_a.shuffle
  end

  def sample_card
    if @temp_deck == []
      return @temp_deck
    else
      return @temp_deck.pop # => [word, definition]
    end
  end

end


class Controller
 
  def input_and_parse_file(filename) #File name MUST BE IN THE SAME DIRECTORY 
    filename_edit = "./" + filename
    file_open = File.open(filename_edit, "r") 
    file_string = file_open.read

    file_array = file_string.split('\n')

      def_array = []
      key_array =[]
      n = 0
      file_array.each_with_index do |string,index| 
        if index == 3*n
            def_array << string
        elsif index == (3 * n) +1
            key_array << string
        end
      end
        @input_file = key_array.zip(def_array)
      
  end


  def populate_deck #sends word and definition strings to Deck.add_card
    @deck_object = Deck.new

    @input_file.each do |string|
      @deck_object.add_card(string[0],string[1])
    end
  end

  def self.control_sequence(txt_filename)
      @input_file = []
      input_and_parse_file(txt_filename)
      populate_deck
      @deck_object
  end

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

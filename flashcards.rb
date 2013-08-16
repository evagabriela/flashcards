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

  def initialize(txt_file)
     @TheDeck = Controller.control_sequence(txt_file)
  end

  def run_game
    #Welcome Message
    puts "Welcome to Ruby Flash Cards. "
    puts "To play, just enter the correct term for each definition."  
    puts "Ready?  Go!"


    #NEXT_CARD_LOOP
      #Pick a card
      current_card = @TheDeck.sample_card
      current_word = current_card.first
      current_def = current_card.last

      #Read definition

      #GUESS_LOOP
        guess = gets.chomp
          #wrong answer
          #quit if  "quit" || "q"
      #END_GUESS_LOOP

      #Next Card? gets Y/N
        #break if gets == "N"
    #END_NEXT_CARD_LOOP

    #Exit Message
    puts "Thanks for playing!"
  end

  def guess

  end

end

GameMaster.new('flashcards.txt')



class Player
  attr_reader :name, :game
  def initialize(name, game)
    @name = name
    @game = game
    @hand = []
    puts "#{name} added to the game"
  end

  def receive_card(card)
    @hand.push(card)
  end

  def play(players)
    who_i_will_ask = players.sample
    card_to_look_for = @hand.sample
    puts "#{name}: Asking #{who_i_will_ask} for #{card_to_look_for}"
    card = who_i_will_ask.ask_for(card_to_look_for)
    if card
      @hand.push(card)
    else
      # I need to go fishin'!
      @hand.push(@game.draw)
    end
  end

  def status
    "Hello, I'm #{name} and I have #{@hand.sort.join(', ')}"
  end

  def ask_for(card)
    if @hand.map(&:name).include?(card.name)
      puts "#{name}: One less card for me. :("
      @hand.pop
    else
      puts "Go Fish!"
    end
  end

  def inspect
    "#{name}"
  end

  def to_s
    inspect
  end
end

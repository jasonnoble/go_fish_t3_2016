require_relative 'card'
require_relative 'player'

class Game
  def initialize
    @cards = initialize_deck
    @players = initialize_players
    deal_cards
  end

  def play_round
    current_player = @players.shift
    puts "Asking #{current_player.name} to play"
    current_player.play(@players)
    @players.push(current_player)
  end

  def draw
    @cards.pop
  end

  def status
    @players.each do |player|
      puts player.status
    end
  end

  def inspect
    "A far too complicated game of Go-Fish"
  end

  def to_s
    inspect
  end

  private

  def deal_cards
    # Deal each player a card
    #   player.receive_card(card)
    5.times do
      @players.each do |player|
        card = @cards.pop
        puts "Dealing #{card} to #{player}"
        player.receive_card(card)
      end
    end
  end

  def initialize_players
    players = []
    players.push(Player.new('Anna', self))
    players.push(Player.new('Evan', self))
    players.push(Player.new('Tommy', self))
    players.push(Player.new('Andrew', self))
  end

  def initialize_deck
    cards = []
    ['Puffer Fish', 'Whale', 'Seahorse',
      'Octopus', 'Purple Tang', 'Yellow Tang',
      'Clown Fish', 'Angelfish', 'Shark'].each do |type|
      4.times do
        cards.push(Card.new(type))
      end
    end
    cards.shuffle
  end
end


# card.rb

class Card
  attr_reader :value, :suit

  CARDS_IN_DECK = [:hearts, :spades, :clubs, :diamonds] + (1..13).to_a

  def initialize(value, suit)
    @value = value
    @suit = suit
    raise ArgumentError.new("invalid card") unless CARDS_IN_DECK.include? @value

  end

  def convert_num_to_face(number)
    return 'Ace' if number == 1
    return 'Jack' if number == 11
    return 'King' if number == 12
    return 'Queen' if number == 13
    return number
  end

  def to_s
    return "#{convert_num_to_face(value)} of #{suit.to_s}"
  end

  def self.value
    card = self.new(@value, @suit)
    return @value
  end

  def self.suit

  end
end


# card.rb

class Card
  attr_reader :value, :suit

  VALID_SUITS = [:hearts, :spades, :clubs, :diamonds]
  VALID_CARDS = (1..13).to_a

  def initialize(value, suit)
    @value = value
    @suit = suit
    raise ArgumentError.new("invalid suit") unless VALID_SUITS.include? @suit
    raise ArgumentError.new("invalid card") unless VALID_CARDS.include? @value

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

end

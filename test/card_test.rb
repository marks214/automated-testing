require_relative 'test_helper'

describe Card do
  describe 'You can create a Card instance' do

    it 'Can be created' do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card).must_be_instance_of Card
        end
      end
    end

    it 'Raises an ArgumentError for invalid parameters' do
      # To raise an ArgumentError in card.rb
      # raise ArgumentError.new
      expect {Card.new(0, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :diamonds)}.must_raise ArgumentError
      expect {Card.new(14, :clovers)}.must_raise ArgumentError
      expect {Card.new(4, :clovers)}.must_raise ArgumentError
    end
  end

  describe 'Testing to_s' do

    it 'to_s returns a readable String value logically for values 2-10' do
      # Test to ensure that to_s works for cards values 2-10
      # for example:  "2 of diamonds"
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (2..10).each do |value|
          card = Card.new(value, suit)
          expect(card.to_s).must_equal "#{value} of #{suit.to_s}"
        end
      end
    end

    it 'convert_num_to_face returns strings Ace, Jack, Queen, or King when given integers
        1, 11, 12, or 13, respectively - otherwise the numerical card value is returned' do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        [1, 2, 11, 12, 13].each do |value|
          card = Card.new(value, suit)
          expect(card.convert_num_to_face(1)).must_equal 'Ace'
          expect(card.convert_num_to_face(11)).must_equal 'Jack'
          expect(card.convert_num_to_face(12)).must_equal 'King'
          expect(card.convert_num_to_face(13)).must_equal 'Queen'
          expect(card.convert_num_to_face(2)).must_equal 2
        end
      end
    end

    it 'to_s returns a readable String value for Ace, Jack, Queen, King' do
      # Test to ensure that to_s works for cards values 1, and 11-13
      # For example: "Queen of hearts"
      # The current implementation of to_s does not address this feature
      # Write the test, see it fail, then modify to_s to make it pass!
      # (Consider writing a helper method!)
      #
      # For reference:
      #  1: Ace
      #  11: Jack
      #  12: Queen
      #  13: King
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        [1, 11, 12, 13].each do |value|
          card = Card.new(value, suit)
          expect(card.to_s).must_equal "#{card.convert_num_to_face(value)} of #{suit.to_s}"
        end
      end
    end
  end

  describe 'Reader methods' do

    it 'Can retrieve the value of the card using a `.value`.' do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card.value).must_equal value
        end
      end
    end

    it 'Can retrieve the value of the card using a `.suit`.' do
      [:hearts, :spades, :clubs, :diamonds].each do |suit|
        (1..13).each do |value|
          card = Card.new(value, suit)
          expect(card.suit).must_equal suit
        end
      end

    end
  end

end

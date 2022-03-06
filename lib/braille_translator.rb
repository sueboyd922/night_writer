require './lib/dictionary'

class BrailleTranslator
  attr_reader :message, :letters
  def initialize(message)
    @dictionary = Dictionary.new(:braille)
    @message = message
    @letters =[]
    # require "pry"; binding.pry
  end

  def breakdown
    @message.split("\n")
  end

  def num_of_letters
    (breakdown[0].length / 2).times do
      @letters << []
    end
  end

  def group_braille
    index = -1
    a = 0
    num_of_letters.times do
      index += 1
      breakdown.each {|lines| @letters[index] << lines[a..a + 1]}
      a += 2
    end
    @letters
  end

  def join_braille_pieces
    group_braille.map{|line| line.join}
  end

  def translate
    join_braille_pieces.map {|letter| @dictionary.lookup(letter)}
  end

  def printable_message
    translate.flatten.join
  end
end

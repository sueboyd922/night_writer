require './lib/dictionary'

class BrailleTranslator
  attr_reader :message, :letters
  def initialize(message)
    @message = message
    @letters =[]
    @dictionary = Dictionary.new(:braille)
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
    # require "pry"; binding.pry
    @letters.map {|line| line.join}
  end

  def translate
    group_braille.map {|letter| @dictionary.lookup(letter)}
  end

end

require './lib/dictionary'
require './lib/translator'

class BrailleTranslator < Translator
  attr_reader :message, :letters
  def initialize(message)
    @dictionary = Dictionary.new(:braille)
    @message = message
    @top = []
    @middle = []
    @bottom = []
    @lines = [@top, @middle, @bottom]
    @letters =[]
    # require "pry"; binding.pry
    run
  end

  def run
    breakdown
    account_for_multiple_lines
    prepare_strings
    num_of_letters
    group_braille
  end

  def breakdown
    @message.split("\n")
  end

  def account_for_multiple_lines
    remove_extra_lines = breakdown.reject {|string| string == "" }
    index = 0
    (remove_extra_lines.count / 3).times do
      @top << remove_extra_lines[index]
      @middle << remove_extra_lines[index + 1]
      @bottom << remove_extra_lines[index + 2]
      index += 3
    end
  end

  def prepare_strings
    @lines = @lines.map {|line| line.flatten.join}
  end

  def num_of_letters
    (@lines[0].length / 2).times do
      @letters << []
    end
  end

  def group_braille
    index = -1
    a = 0
    (@lines[0].length / 2).times do
      index += 1
      @lines.each do |line|
        @letters[index] << line[a..a + 1]
      end
      a += 2
    end
  end

  def join_braille_pieces
    @letters.map{|line| line.join}
  end

  def translate
    join_braille_pieces.map {|letter| @dictionary.lookup(letter)}
  end

  def printable_message
    translate.flatten.join
  end
end

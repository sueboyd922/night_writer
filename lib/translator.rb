require './lib/dictionary'

class Translator
  attr_reader :message, :top, :middle, :bottom

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @top = []
    @middle = []
    @bottom = []
    @lines = [@top, @middle, @bottom]
  end

  def breakdown
    @message.split("")
  end

  def translate
    breakdown.map {|letter| @dictionary.lookup(letter.downcase)}
  end

  def split_braille
    translate.each do |braille|
      @top << braille[0..1]
      @middle << braille[2..3]
      @bottom << braille[4..5]
    end
  end

  def create_braille_string
    @lines.map do |line|
      line.flatten.join
    end
  end

  def add_line_breaks
    create_braille_string.each do |line|
      line.insert(-1, "\n")
    end
  end

  def printable_message
    add_line_breaks.join
  end
end

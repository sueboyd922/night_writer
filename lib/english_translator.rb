require './lib/dictionary'
require './lib/translator'

class EnglishTranslator < Translator
  # attr_reader :message, :lines, :letters

  # def initialize(message)
  #   @message = message
  #   @dictionary = Dictionary.new(:english)
  #   @top = []
  #   @middle = []
  #   @bottom = []
  #   @lines = [@top, @middle, @bottom]
  #   @letters = []
  #   run
  # end
  def create_dictionary
    @dictionary = Dictionary.new(:english)
  end

  def run
    breakdown("")
    translate
    split_braille
    create_braille_string
    adjust_for_character_count
  end

  def translate
    @message = @message.map {|letter| @dictionary.lookup(letter)}
  end

  def split_braille
    @message.each do |braille|
      @top << braille[0..1]
      @middle << braille[2..3]
      @bottom << braille[4..5]
    end
  end

  def create_braille_string
    @lines = @lines.map do |line|
      line.flatten
    end
  end

  def adjust_for_character_count
    a = 0
    (@lines[0].count.to_f / 40).ceil.times do
      @lines.each do |line|
        @letters << line[a..a + 39]
        @letters << "\n"
      end
      @letters << "\n"
      a += 40
    end
  end
end

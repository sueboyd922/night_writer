require './lib/dictionary'
require './lib/translator'

class EnglishTranslator < Translator
  attr_reader :message, :lines, :final_message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new(:english)
    @top = []
    @middle = []
    @bottom = []
    @lines = [@top, @middle, @bottom]
    @final_message = []
    run
  end

  def run
    split_braille
    create_braille_string
  end

  def breakdown
    @message.split("")
  end

  def translate
    breakdown.map {|letter| @dictionary.lookup(letter)}
  end

  def split_braille
    translate.each do |braille|
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
        @final_message << line[a..a + 39]
        @final_message << "\n"
      end
      @final_message << "\n"
      a += 40
    end
    @final_message
  end

  def printable_message
    adjust_for_character_count.flatten.join
  end
end

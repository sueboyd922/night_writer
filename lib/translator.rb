require './lib/dictionary'

class Translator
  attr_reader :message, :top, :middle, :bottom, :final_message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @top = []
    @middle = []
    @bottom = []
    @lines = [@top, @middle, @bottom]
    @final_message = []
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
      line.flatten
    end
  end

  def adjust_for_character_count
    a = 0
    (create_braille_string[0].count.to_f / 40).ceil.times do
      @lines.each do |line|
        @final_message << line[a..a + 39]
        @final_message << "\n"
      end
      @final_message << "\n"
      a += 40
    end
  end

  # def add_line_breaks
  #   create_braille_string.each do |line|
  #     line.insert(-1, "\n")
  #   end
  # end

  def printable_message
    @final_message.flatten.join
    # add_line_break.join
  end
end

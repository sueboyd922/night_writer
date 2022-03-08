require './lib/dictionary'
require './lib/translator'

class EnglishTranslator < Translator

  def create_dictionary
    @dictionary = Dictionary.new(:english)
  end

  def run
    breakdown("")
    translate
    split_braille
    create_braille_string
    adjust_for_character_count
    set_message_to_letters
  end

  def for_capitals
    for_capitals = []
    @message.each do |line|
      if line.length > 6
        for_capitals << line.chars[0..5].join
        for_capitals << line.chars[6..11].join
      else
        for_capitals << line
      end
    end
    for_capitals
  end

  def split_braille
    for_capitals.each do |braille|
      @top << braille[0..1]
      @middle << braille[2..3]
      @bottom << braille[4..5]
    end
    @message = [@top, @middle, @bottom]
  end

  def create_braille_string
    @message = @message.map do |line|
      line.flatten
    end
  end

  def adjust_for_character_count
    a = 0
    (@message[0].count.to_f / 40).ceil.times do
      @message.each do |line|
        @letters << line[a..a + 39]
        @letters << "\n"
      end
      @letters << "\n"
      a += 40
    end
  end

  def set_message_to_letters
    @message = @letters
  end
end

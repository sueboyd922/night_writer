require './lib/dictionary'
require './lib/translator'

class BrailleTranslator < Translator

  def create_dictionary
    @dictionary = Dictionary.new(:braille)
  end

  def run
    breakdown("\n")
    account_for_multiple_lines
    prepare_strings
    num_of_letters
    group_braille
    join_braille_pieces
    translate
    capitals
  end

  def account_for_multiple_lines
    @message = @message.reject {|string| string == "" }
    index = 0
    (@message.count / 3).times do
      @top << @message[index]
      @middle << @message[index + 1]
      @bottom << @message[index + 2]
      index += 3
    end
    @message = [@top, @middle, @bottom]
  end

  def prepare_strings
    @message = @message.map {|line| line.flatten.join}
  end

  def num_of_letters
    (@message[0].length / 2).times do
      @letters << []
    end
  end

  def group_braille
    index = -1
    a = 0
    (@message[0].length / 2).times do
      index += 1
      @message.each do |line|
        @letters[index] << line[a..a + 1]
      end
      a += 2
    end
  end

  def join_braille_pieces
    @message = @letters.map{|line| line.join}
  end

  def capitals
    @new_message = []
    index = 0
    (@message.count).times do
      if @message[index] == nil && !@message[index + 1].nil?
        @new_message << @message[index + 1].upcase
        index += 2
      else
        @new_message << @message[index]
        index += 1
      end
    end
    @message = @new_message.compact
  end

end

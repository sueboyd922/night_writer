require './lib/dictionary'

class Translator

  attr_reader :message, :letters, :lines
  def initialize(message)
    create_dictionary
    @message = message
    @top = []
    @middle = []
    @bottom = []
    @lines = [@top, @middle, @bottom]
    @letters =[]
  end

  def breakdown(split)
    @message = @message.split(split)
  end

  # def translate(input)
  #   @letters = @letters.map {|letter| @dictionary.lookup(letter)}
  # end

  def printable_message
    @letters.flatten.join
  end

end

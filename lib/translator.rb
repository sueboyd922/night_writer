require './lib/dictionary'

class Translator
  attr_reader :message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
  end

  def breakdown
    @message.split("")
  end

  def translate
    breakdown.map {|letter| @dictionary.lookup(letter.downcase)}
  end





end

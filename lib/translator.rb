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
    # run
  end

  def breakdown(split)
    # require "pry"; binding.pry
    @message = @message.split(split)
  end

end

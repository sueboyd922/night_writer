require './lib/dictionary'

class Translator
  attr_reader :message

  def initialize(message)
    @message = message
  end

  def breakdown
    # require "pry"; binding.pry
    @message.split("")
  end




end

require './lib/dictionary'

class BrailleTranslator
  attr_reader :message

  def initialize(message)
    @message = message

  end

  def breakdown
    @message.split("\n")
  end

end

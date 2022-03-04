
class Dictionary
  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def switch_language
    @language = :braille
  end
end

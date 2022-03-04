
class Dictionary
  attr_reader :language

  def initialize(language = :english)
    @language = language
  end

  def switch_language
    @language = :braille
  end

  def info
    dictionary = {
      "a" => "O.....",
      "b" => "O.O...",
      "c" => "OO....",
      "d" => "OO.O..",
      "e" => "O..O..",
      "f" => "OOO...",
      "t" => ".OOOO."
    }
  end

end

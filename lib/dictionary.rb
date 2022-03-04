
class Dictionary
  attr_reader :language

  def initialize(language = :english)
    @language = language
    @info = info
  end

  def switch_language
    case @language
    when :english
      @language = :braille
    when :braille
      @language = :english
    end
    @info = @info.invert
  end

  def info
    {
      "a" => "O.....",
      "b" => "O.O...",
      "c" => "OO....",
      "d" => "OO.O..",
      "e" => "O..O..",
      "f" => "OOO...",
      "t" => ".OOOO."
    }
  end

  def lookup(letter)
    @info[letter]
  end

end


class Dictionary
  attr_reader :language

  def initialize(language)
    @language = language
    @info = determine_dictionary
  end

  def determine_dictionary
    case @language
    when :english
      info
    when :braille
      info.invert
    end
  end

  def info
    {
      "a" => "O.....",
      "b" => "O.O...",
      "c" => "OO....",
      "d" => "OO.O..",
      "e" => "O..O..",
      "f" => "OOO...",
      "g" => "OOOO..",
      "h" => "O.OO..",
      "i" => ".OO...",
      "j" => ".OOO..",
      "k" => "O...O.",
      "l" => "O.O.O.",
      "m" => "OO..O.",
      "n" => "OO.OO.",
      "o" => "O..OO.",
      "p" => "OOO.O.",
      "q" => "OOOOO.",
      "r" => "O.OOO.",
      "s" => ".OO.O.",
      "t" => ".OOOO.",
      "u" => "O...OO",
      "v" => "O.O.OO",
      "w" => ".OOO.O",
      "x" => "OO..OO",
      "y" => "OO.OOO",
      "z" => "O..OOO",
      " " => "......",
      "," => "..O...",
      "." => "..OO.O",
      "!" => "..OOO.",
      "&" => "OOO.OO",
      "?" => "..O.OO",
      "'" => "....O."
    }
  end

  def lookup(letter)
    new_letter = @info[letter]
    if letter.length == 1 && !punctuation(letter)
      new_letter = ".....O" + @info[letter.downcase] if is_upcase?(letter)
    end
    new_letter
  end

  def punctuation(letter)
    punc_symbols = ["?", " ", ",", ".", "!", "&", "'"]
    punc_symbols.include?(letter)
  end

  def is_upcase?(letter)
    letter == letter.upcase
  end

end


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
      "'" => "....O.",
      "(" => "O.OOOO",
      ")" => ".OOOOO",
      "-" => "....OO",
      "/" => ".O..O.",
      "1" => ".O.OOOO.....",
      "2" => ".O.OOOO.O...",
      "3" => ".O.OOOOO....",
      "4" => ".O.OOOOO.O..",
      "5" => ".O.OOOO..O..",
      "6" => ".O.OOOOOO...",
      "7" => ".O.OOOOOOO..",
      "8" => ".O.OOOO.OO..",
      "9" => ".O.OOO.OO...",
      "0" => ".O.OOO.OOO..",
    }
  end

  def lookup(letter)
    new_letter = @info[letter]
    if letter.length == 12 && letter[0..5] == ".....O"
      new_letter = @info[letter[6..11]].upcase
    end
    if letter.length == 1 && !punctuation(letter) && !number(letter)
      new_letter = ".....O" + @info[letter.downcase] if is_upcase?(letter)
    end
    new_letter
  end

  def punctuation(letter)
    punc_symbols = ["?", " ", ",", ".", "!", "&", "'", "(", ")", "-", "/"]
    punc_symbols.include?(letter)
  end

  def number(letter)
    numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    numbers.include?(letter)
  end

  def is_upcase?(letter)
    letter == letter.upcase
  end
end

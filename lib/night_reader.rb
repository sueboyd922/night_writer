require 'pry'
require './lib/translator'

class NightReader
  attr_reader :file, :read_message, :braille

  def initialize(file)
    @file = file
    @read_message = read_file.strip
    @braille = create_new_file
    @translator = Translator.new(@read_message)
    run
  end

  def run
    write_to_new_file
    print_update
  end

  def open_file
     File.open(@file, 'r')
  end

  def read_file
    open_file.read
  end

  def create_new_file
    File.open(ARGV[1], 'w')
  end

  def write_to_new_file
    @braille.write(new_message)
  end
end

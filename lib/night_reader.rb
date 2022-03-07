require 'pry'
require './lib/translator'
require './lib/braille_translator'

class NightReader
  attr_reader :file, :read_message, :new_file

  def initialize(file)
    @incoming_file = file
    @read_message = read_file.strip
    @new_file = create_new_file
    @translator = BrailleTranslator.new(@read_message)
    run
  end

  def run
    write_to_new_file
    print_update
  end

  def open_file
     File.open(@incoming_file, 'r')
  end

  def read_file
    open_file.read
  end

  def create_new_file
    File.open(ARGV[1], 'w')
  end

  def write_to_new_file
    @new_file.write(new_message)
  end

  def new_message
    @translator.printable_message
  end

  def print_update
    print "Created '#{ARGV[1]}' containing #{@read_message.length} characters"
  end
end

require 'pry'
require './lib/translator'

class NightWriter
  attr_reader :message, :read_message, :braille

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
    # require "pry"; binding.pry
    @braille.write(new_message)
  end

  def new_message
    # require "pry"; binding.pry
    send_out_message_for_translation
    @translator.printable_message
  end

  def send_out_message_for_translation
    @translator.split_braille
    @translator.create_braille_string
  end

  def print_update
    print "Created '#{ARGV[1]}' containing #{@read_message.length} characters"
  end
end

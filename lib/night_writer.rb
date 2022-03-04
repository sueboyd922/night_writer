require 'pry'

class NightWriter
  attr_reader :message, :read_message, :braille

  def initialize(file)
    @file = file
    @message = open_file
    @read_message = read_file
    @braille = create_new_file
    # binding.pry
    run
  end

  def run
    read_file
    create_new_file
    write_to_new_file
    print_update
  end

  def open_file
     File.open(@file, 'r')
  end

  def read_file
    open_file
     @message.read
  end

  def create_new_file
    File.open(ARGV[1], 'w')
  end

  def write_to_new_file
    @braille.write(new_message)
  end

  def new_message
    @read_message.reverse
  end

  def print_update
    print "Created '#{ARGV[1]}' containing #{@read_message.length} characters"
  end
end

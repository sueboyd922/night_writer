require 'pry'

class NightWriter
  attr_reader :message, :read_message

  def initialize(file)
    @file = file
    @message = nil
    @read_message
    # binding.pry
  end

  def open_file
    @message = File.open(@file, 'r')
  end

  def read_file
    open_file
    @read_message = @message.read
  end

end

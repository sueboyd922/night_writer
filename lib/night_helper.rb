module NightHelper

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

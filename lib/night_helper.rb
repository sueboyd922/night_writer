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

end

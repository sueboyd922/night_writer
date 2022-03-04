require 'rspec'
require './lib/night_writer'

describe NightWriter do
  before (:each) do
    ARGV[0] = './spec/test_files/test_message.txt'
    ARGV[1] = './spec/test_files/new_test_message.txt'
    @night_writer = NightWriter.new(ARGV[0])
    # require "pry"; binding.pry
  end

  it 'exists' do
    expect(@night_writer).to be_an_instance_of(NightWriter)
  end

  it 'opens a file' do
    @night_writer.open_file
    expect(@night_writer.message.class).to eq(File)
  end

  it 'reads a file' do
    @night_writer.read_file
    expect(@night_writer.read_message.class).to eq(String)
  end

  it 'creates a new file' do
    @night_writer.create_new_file
    expect(@night_writer.braille.class).to eq(File)
  end


  it 'tells you what has been created' do
    expect{@night_writer.print_update}.to output("Created './spec/test_files/new_test_message.txt' containing 42 characters").to_stdout
  end

end

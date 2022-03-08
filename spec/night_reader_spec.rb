require 'rspec'
require './lib/night_reader'

describe NightReader do
  before (:each) do
    ARGV[0] = './spec/test_files/braille_to_english_test.txt'
    ARGV[1] = './spec/test_files/braille_to_english_result.txt'
    @night_reader = NightReader.new(ARGV[0])
  end

  it 'exists' do
    expect(@night_reader).to be_an_instance_of(NightReader)
  end

  it 'opens a file' do
    @night_reader.open_file
    expect(@night_reader.open_file.class).to eq(File)
  end

  it 'reads a file' do
    @night_reader.read_file
    expect(@night_reader.read_message.class).to eq(String)
  end

  it 'creates a new file' do
    @night_reader.create_new_file
    expect(@night_reader.new_file.class).to eq(File)
  end

  it 'tells you what has been created' do
    expect{@night_reader.print_update}.to output("Created './spec/test_files/braille_to_english_result.txt' containing 50 characters").to_stdout
  end

  it 'writes to a new file' do
    created_file = File.open(@night_reader.new_file, 'r')
    new_message = created_file.read
    require "pry"; binding.pry
    expect(new_message).to eq("potatoes")
  end

end

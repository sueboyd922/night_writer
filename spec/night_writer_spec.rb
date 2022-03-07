require 'rspec'
require './lib/night_writer'

describe NightWriter do
  before (:each) do
    ARGV[0] = './spec/test_files/test_message.txt'
    ARGV[1] = './spec/test_files/new_test_message.txt'
    @night_writer = NightWriter.new(ARGV[0])
  end

  it 'exists' do
    expect(@night_writer).to be_an_instance_of(NightWriter)
  end

  it 'opens a file' do
    @night_writer.open_file
    expect(@night_writer.open_file.class).to eq(File)
  end

  it 'reads a file' do
    @night_writer.read_file
    expect(@night_writer.read_message.class).to eq(String)
  end

  it 'creates a new file' do
    @night_writer.create_new_file
    expect(@night_writer.new_file.class).to eq(File)
  end

  it 'tells you what has been created' do
    expect{@night_writer.print_update}.to output("Created './spec/test_files/new_test_message.txt' containing 41 characters").to_stdout
  end

  xit 'writes into the new file' do
    new_file = File.open(@night_writer.braille, 'r')
    # require "pry"; binding.pry
    new_message = new_file.read
    expect(new_message).to eq(".OO..O.O...O.O..O.OOO..OO.O.O...OOO.O..OO.OO.O...OO...OOO..OO.O...OOO...OOO.O.O.\nOOOOO.O...O.O......O.OOOOO.OOO..O.OO.OOO.O..OO..OO.O...OOOO.O..O.....O....OO...O\nO.....O.....O.....O.O.O.....O...O.O.O.......O...O.O.....O...OO....O.......O...OO\n\nOO\n.O\nOO\n\n")
  end
  #test what actually gets written to file

end

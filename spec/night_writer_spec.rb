require 'rspec'
require './lib/night_writer'

describe NightWriter do

  it 'exists' do
    @night_writer = NightWriter.new('message.txt')

    expect(@night_writer).to be_an_instance_of(NightWriter)
  end

  it 'opens a file' do
    @night_writer.open_file
    expect(@night_writer.message.class).to eq(File)
  end

  it 'reads a file' do
    @night_writer.read_file
    expect(@night_writer.message.class).to eq(String)
  end
end

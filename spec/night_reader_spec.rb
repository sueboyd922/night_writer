require 'rspec'
require './lib/night_reader'

describe NightReader do
  before (:each) do
    ARGV[0] = './spec/test_files/test_message.txt'
    ARGV[1] = './spec/test_files/new_test_message.txt'
    @night_reader = NightReader.new(ARGV[0])
  end

  it 'exists' do
    expect(@night_reader).to be_an_instance_of(NightReader)
  end

  it 'opens a file' do
    @night_reader.open_file
    expect(@night_reader.open_file.class).to eq(File)
  end

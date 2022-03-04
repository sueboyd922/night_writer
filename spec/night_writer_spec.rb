require 'rspec'
require './lib/night_writer'

describe NightWriter do

  it 'exists' do
    @night_writer = NightWriter.new('message.txt')

    expect(@night_writer).to be_an_instance_of(NightWriter)
  end
end

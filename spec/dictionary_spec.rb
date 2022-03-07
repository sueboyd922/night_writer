require 'rspec'
require './lib/dictionary'

describe Dictionary do
  before (:each) do
    @dictionary = Dictionary.new(:english)
    @dictionary2 = Dictionary.new(:braille)
  end

  it 'exists' do
    expect(@dictionary).to be_an_instance_of(Dictionary)
  end

  it 'is initialized with a language' do
    expect(@dictionary.language).to eq(:english)
  end

  it 'can be used as a Braille to English dictionary too' do
    expect(@dictionary2.language).to eq(:braille)
  end

  it 'holds a dictionary of english-braille' do
    expect(@dictionary.info.class).to eq(Hash)
  end

  it 'switches hash key/values based on which languge is being searched' do
    expect(@dictionary.determine_dictionary).to eq(@dictionary.info)
    expect(@dictionary2.determine_dictionary).to eq(@dictionary2.info.invert)
  end

  it 'can look up the letter in english' do
    expect(@dictionary.lookup("a")).to eq("O.....")
    expect(@dictionary.lookup("g")).to eq("OOOO..")
    expect(@dictionary.lookup("t")).to eq(".OOOO.")
    expect(@dictionary.lookup("j")).to eq(".OOO..")
  end

  it 'can look up the letter in Braille' do
    expect(@dictionary2.lookup(".OOOO.")).to eq("t")
    expect(@dictionary2.lookup("OOOOO.")).to eq("q")
    expect(@dictionary2.lookup("OO....")).to eq("c")
    expect(@dictionary2.lookup("O..OOO")).to eq("z")
  end

  it 'returns nil if the letter is not in the dictionary' do
    expect(@dictionary.lookup("mm")).to eq(nil)
    expect(@dictionary2.lookup("OOOOOO")).to eq(nil)
  end
end

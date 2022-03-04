require 'rspec'
require './lib/dictionary'

describe Dictionary do
  before (:each) do
    @dictionary = Dictionary.new
  end

  it 'exists' do
    expect(@dictionary).to be_an_instance_of(Dictionary)
  end

  it 'defaults to English language' do
    expect(@dictionary.language).to eq(:english)
  end

  it 'can switch to Braille language' do
    @dictionary.switch_language
    expect(@dictionary.language).to eq(:braille)
  end

  it 'holds a dictionary of english-braille' do
    expect(@dictionary.info.class).to eq(Hash)
  end

  it 'can look up the letter in english' do
    expect(@dictionary.lookup("a")).to eq("O.....")
    expect(@dictionary.lookup("g")).to eq("OOOO..")
    expect(@dictionary.lookup("t")).to eq(".OOOO.")
    expect(@dictionary.lookup("j")).to eq(".OOO..")
  end

  it 'can look up the letter in Braille' do
    @dictionary.switch_language
    expect(@dictionary.lookup(".OOOO.")).to eq("t")
    expect(@dictionary.lookup("OOOOO.")).to eq("q")
    expect(@dictionary.lookup("OO....")).to eq("c")
    expect(@dictionary.lookup("O..OOO")).to eq("z")
  end

  it 'can switch languages back' do
    expect(@dictionary.language).to eq(:english)
    @dictionary.switch_language
    expect(@dictionary.language).to eq(:braille)
    @dictionary.switch_language
    expect(@dictionary.language).to eq(:english)
  end
end

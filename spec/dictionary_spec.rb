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
end

require 'rspec'
require './lib/translator'

describe Translator do
  before (:each) do
    @translator = Translator.new("Whats taters precious")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(Translator)
  end

  it 'takes in a single message to translate' do
    expect(@translator.message).to eq("Whats taters precious")
  end

  it 'can break down the message for translation' do
    expect(@translator.breakdown.class).to eq(Array)
    expect(@translator.breakdown.count).to eq(21)
  end
end

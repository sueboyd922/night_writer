require 'rspec'
require './lib/braille_translator'

describe BrailleTranslator do
  before (:each) do
    @translator = BrailleTranslator.new("OOO..OO..OO.O..O\nO..OOO..OO.O.OO.\nO.O.O...O.O...O.")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(BrailleTranslator)
  end

  it 'takes in a single message to translate' do
    expect(@translator.message).to eq("OOO..OO..OO.O..O\nO..OOO..OO.O.OO.\nO.O.O...O.O...O.")

  end

  it 'can break down the message for translation' do
    expect(@translator.breakdown.class).to eq(Array)
    expect(@translator.breakdown.count).to eq(3)
  end

  it 'can group the message into braille letters' do
    @translator.group_braille
    expect(@translator.letters.class).to eq(Array)
    expect(@translator.letters.count).to eq(8)
  end

  it 'can translate the braille to english letters' do
    expect(@translator.translate).to eq(["p", "o", "t", "a", "t", "o", "e", "s"])
  end

  it 'returns a printable message' do
    expect(@translator.printable_message).to eq("potatoes")
  end
end

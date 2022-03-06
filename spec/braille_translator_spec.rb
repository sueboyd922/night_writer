require 'rspec'
require './lib/braille_translator'

describe BrailleTranslator do
  before (:each) do
    @translator = BrailleTranslator.new("OOO..OO..OO.O..O\nO..OOO..OO.O.OO.\nO.O.O...O.O...O.")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(BrailleTranslator)
  end
end

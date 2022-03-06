require 'rspec'
require './lib/translator'

describe Translator do
  before (:each) do
    @translator = Translator.new("Whats taters precious")
    # require "pry"; binding.pry
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
    @translator.translate
  end

  it 'can translate each letter to braille' do
    expect(@translator.translate.class).to eq(Array)
    expect(@translator.translate[0]).to eq(".OOO.O")
    expect(@translator.translate[3]).to eq(".OOOO.")
    expect(@translator.translate.count).to eq(21)
  end

  it 'separates the braille letters into 3 rows for printing' do
    @translator.split_braille
    expect(@translator.top.class).to eq(Array)
    expect(@translator.top.count).to eq(21)
    expect(@translator.middle.class).to eq(Array)
    expect(@translator.middle.count).to eq(21)
    expect(@translator.bottom.class).to eq(Array)
    expect(@translator.bottom.count).to eq(21)
  end

  it 'joins all the braille together for printing' do
    @translator.split_braille
    expect(@translator.create_braille_string[0].length).to eq(21)
  end

  it 'can print the new message' do
    @translator.split_braille
    @translator.adjust_for_character_count
    expect(@translator.printable_message).to eq(".OO.O..O.O...OO..OO.O..O..OOO.O.OO.OO.O..O\nOOOO..OOO...OO..OO.OOOO...O.OO.O..O..O..O.\n.O....O.O...O...O...O.O...O.O.......O.OOO.\n\n")
  end

end

require 'rspec'
require './lib/english_translator'

describe EnglishTranslator do
  before (:each) do
    @translator = EnglishTranslator.new("whats taters precious")
    @translator2 = EnglishTranslator.new("HI Frodo")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(EnglishTranslator)
  end

  it 'takes in a single message to translate' do
    expect(@translator.message).to eq("whats taters precious")
  end

  it 'can break down the message for translation' do
    @translator.breakdown("")
    expect(@translator.message.class).to eq(Array)
    expect(@translator.message.count).to eq(21)
  end

  it 'can translate each letter to braille' do
    @translator.breakdown("")
    @translator.translate
    expect(@translator.message.class).to eq(Array)
    expect(@translator.message[0]).to eq(".OOO.O")
    expect(@translator.message[3]).to eq(".OOOO.")
    expect(@translator.message.count).to eq(21)
  end

  it 'separates the braille letters into 3 rows for printing' do
    @translator.breakdown("")
    @translator.translate
    @translator.split_braille
    # require "pry"; binding.pry
    expect(@translator.message[0].class).to eq(Array)
    expect(@translator.message[0].count).to eq(21)
    expect(@translator.message[1].class).to eq(Array)
    expect(@translator.message[1].count).to eq(21)
    expect(@translator.message[2].class).to eq(Array)
    expect(@translator.message[2].count).to eq(21)
  end

  it 'joins all the braille together for printing' do
    @translator.breakdown("")
    @translator.translate
    @translator.split_braille
    @translator.create_braille_string
    expect(@translator.message.count).to eq(3)
    expect(@translator.message[0].length).to eq(21)
  end

  it 'can print the new message' do
    @translator.run
    expect(@translator.printable_message).to eq(".OO.O..O.O...OO..OO.O..O..OOO.O.OO.OO.O..O\nOOOO..OOO...OO..OO.OOOO...O.OO.O..O..O..O.\n.O....O.O...O...O...O.O...O.O.......O.OOO.\n\n")
  end

  it 'can print in capitals' do
    translator2 = EnglishTranslator.new("HI Frodo")
    translator2.run
    expect(translator2.printable_message).to eq("..O....O....OOO.O.OOO.\n..OO..O.....O.OO.O.O.O\n.O...O.....O..O.O...O.\n\n")
  end

  it 'can print in numbers' do
    translator2 = EnglishTranslator.new("12345")
    translator2.run
    expect(translator2.printable_message).to eq(".OO..OO..OOO.OOO.OO.\n.O...OO..O...O.O.O.O\nOO..OO..OO..OO..OO..\n\n")
  end

end

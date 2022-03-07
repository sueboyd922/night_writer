require 'rspec'
require './lib/braille_translator'

describe BrailleTranslator do
  before (:each) do
    @translator = BrailleTranslator.new("OOO..OO..OO.O..O\nO..OOO..OO.O.OO.\nO.O.O...O.O...O.")
    @translator2 = BrailleTranslator.new(".OO.O...OOO..OOOO...O.O.O..OOO..OOO.OO...OO.OOOO.O..O.O.O.O....OO.O...O.O.O.OO..\nOOOO.O..OO..O.......O.OO.OOO.O..O..O....OO....O.O....OO..OOO..OOOO.O..O....O.O..\nO.......O.OO....O.....O.O..OO.....O.OO....OOO.O.O...O.OO..O...O.......O...OOOO..\n\nOOO.OO\n.O.OOO\n..O...")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(BrailleTranslator)
  end

  it 'takes in a single message to translate' do
    expect(@translator.message).to eq("OOO..OO..OO.O..O\nO..OOO..OO.O.OO.\nO.O.O...O.O...O.")
  end

  it 'can break down the message for translation' do
    @translator.breakdown("\n")
    expect(@translator.message.class).to eq(Array)
    expect(@translator.message.count).to eq(3)
  end

  it 'gets the strings put together into 3 arrays' do
    @translator.breakdown("\n")
    @translator.account_for_multiple_lines
    @translator.prepare_strings
    expect(@translator.message.count).to eq(3)
    expect(@translator.message[0].length).to eq(16)
  end

  it 'can group the message into braille letters' do
    @translator.breakdown("\n")
    @translator.account_for_multiple_lines
    @translator.prepare_strings
    @translator.num_of_letters
    @translator.group_braille
    expect(@translator.letters.class).to eq(Array)
    expect(@translator.letters.count).to eq(8)
  end

  it 'can translate the braille to english letters' do
    @translator.breakdown("\n")
    @translator.account_for_multiple_lines
    @translator.prepare_strings
    @translator.num_of_letters
    @translator.group_braille
    @translator.join_braille_pieces
    @translator.translate
    expect(@translator.message).to eq(["p", "o", "t", "a", "t", "o", "e", "s"])
  end

  it 'returns a printable message' do
    @translator.run
    expect(@translator.printable_message).to eq("potatoes")
  end

  it 'accounts for multiple lines of braille' do
    @translator2.breakdown("\n")
    expect(@translator2.message.count).to eq(7)
    @translator2.account_for_multiple_lines
    expect(@translator2.message.count).to eq(3)
    @translator2.prepare_strings
    expect(@translator2.num_of_letters).to eq(43)
    @translator2.group_braille
    @translator2.join_braille_pieces
    @translator2.translate
    expect(@translator2.printable_message).to eq("the quick brown fox jumps over the lazy dog")
  end
end

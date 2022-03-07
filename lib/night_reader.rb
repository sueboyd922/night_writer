require 'pry'
require './lib/braille_translator'
require './lib/night_helper'

class NightReader < Night

  def create_translator
    @translator = BrailleTranslator.new(@read_message)
  end

end

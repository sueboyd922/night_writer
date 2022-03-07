require 'pry'
require './lib/english_translator'
require './lib/night_helper'

class NightWriter < Night

  def create_translator
    @translator = EnglishTranslator.new(@read_message)
  end

end

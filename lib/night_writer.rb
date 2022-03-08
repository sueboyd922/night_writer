require 'pry'
require './lib/english_translator'
require './lib/night'

class NightWriter < NightDaddy

  def create_translator
    @translator = EnglishTranslator.new(@read_message)
  end

end

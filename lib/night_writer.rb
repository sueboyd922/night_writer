require 'pry'
require './lib/english_translator'
require './lib/night'

class NightWriter < NightDaddy

  def create_translator
    @translator = EnglishTranslator.new(@read_message)
  end

  def print_update
    print "Created '#{ARGV[1]}' containing #{@created_message.length / 6} Braille characters"
  end

end

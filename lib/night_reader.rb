require 'pry'
require './lib/braille_translator'
require './lib/night'

class NightReader < NightDaddy

  def create_translator
    @translator = BrailleTranslator.new(@read_message)
  end

  def print_update
    print "Created '#{ARGV[1]}' containing #{@created_message.length} English characters"
  end

end

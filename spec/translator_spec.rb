require 'rspec'
require './lib/translator'

describe Translator do
  before (:each) do
    @translator = Translator.new("Whats taters precious")
  end

  it 'exists' do
    expect(@translator).to be_an_instance_of(Translator)
  end
end

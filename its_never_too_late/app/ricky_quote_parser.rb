class RickyQuoteParser

  attr_reader :quotes

  def initialize
    @quotes = File.readlines(APP_ROOT + 'fixtures/quotes.txt')
  end

end

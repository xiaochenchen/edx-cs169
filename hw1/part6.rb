class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.00}
  def method_missing(method_id)
    singular_currency = to_singular(method_id)
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(currency)
    singular_currency = to_singular(currency)
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
  private
  def to_singular(word)
    word.to_s.gsub(/s$/, '')
  end
end

class String
  def palindrome?
    words = self.downcase.gsub(/\W/, "")
    return words == words.reverse
  end
end

module Enumerable
  def palindrome?
    self.collect { |x| x } == self.collect { |x| x }.reverse
  end
end

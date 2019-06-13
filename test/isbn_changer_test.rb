require 'minitest/autorun'

def change_isbn(isbn13)
  isbn13[3..-2]
    .each_char.with_index
    .inject(0) { |sum, (c, i)| sum + c.to_i * (10 - i) }
    .then { |sum| 11 - sum % 11 }
    .then { |raw_digit| raw_digit == 10 ? 'X' : raw_digit == 11 ? '0' : raw_digit }
    .then { |digit| "#{isbn13[3..-2]}#{digit}" }
end

class IsbnChangerTest < Minitest::Test
  def test_change_isbn
    assert_equal '4063842762', change_isbn('9784063842760')
  end

  def test_change_isbn_x
    assert_equal '477418361X', change_isbn('9784774183619')
  end

  def test_change_isbn_0
    assert_equal '4797386290', change_isbn('9784797386295')
  end
end

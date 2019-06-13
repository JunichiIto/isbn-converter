require 'minitest/autorun'

def convert_isbn(isbn13)
  (body = isbn13[3..-2])
    .each_char.with_index
    .inject(0) { |sum, (c, i)| sum + c.to_i * (10 - i) }
    .then { |sum| 11 - sum % 11 }
    .then { |raw_digit| { 10 => 'X', 11 => 0 }[raw_digit] || raw_digit }
    .then { |digit| "#{body}#{digit}" }
end

class IsbnConverterTest < Minitest::Test
  def test_convert_isbn
    assert_equal '4063842762', convert_isbn('9784063842760')
  end

  def test_convert_isbn_x
    assert_equal '477418361X', convert_isbn('9784774183619')
  end

  def test_convert_isbn_0
    assert_equal '4797386290', convert_isbn('9784797386295')
  end
end

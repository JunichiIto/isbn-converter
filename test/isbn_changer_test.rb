require 'minitest/autorun'

def change_isbn(isbn13)
  body = isbn13[3..-2]
  sum = body.each_char.map.with_index{|a,b| a.to_i * (10-b) }.sum
  mod = sum % 11
  raw_digit = 11 - mod
  digit =
    case raw_digit
    when 11 then '0'
    when 10 then 'X'
    else raw_digit.to_s
    end
  "#{body}#{digit}"
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

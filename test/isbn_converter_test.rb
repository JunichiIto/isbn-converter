require './lib/isbn_converter'
require 'minitest/autorun'

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

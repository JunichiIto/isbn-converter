# ISBN Converter

Convert ISBN13 to ISBN10.

## Specification

Please refer:

[ISBN13をISBN10に変換するロジックの解説 · DQNEO起業日記](http://dqn.sakusakutto.jp/2013/10/isbn13isbn10.html)

## Usage

Requires Ruby 2.6.0 or higher.

```ruby
require './lib/isbn_converter'

convert_isbn('9784063842760') #=> "4063842762" 
convert_isbn('9784774183619') #=> "477418361X"
convert_isbn('9784797386295') #=> "4797386290"
```

## License

MIT License.

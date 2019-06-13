def convert_isbn(isbn13)
  (body = isbn13[3..-2])
    .each_char.with_index
    .inject(0) { |sum, (c, i)| sum + c.to_i * (10 - i) }
    .then { |sum| 11 - sum % 11 }
    .then { |raw_digit| { 10 => 'X', 11 => 0 }[raw_digit] || raw_digit }
    .then { |digit| "#{body}#{digit}" }
end

require './lib/credit_check'

puts 'ENTER CARD NUMBER'

card_number = gets.chomp.to_i

check_card = CreditCheck.new(card_number)

check_card.double_card_numbers

check_card.card_valid?

if check_card.card_valid? == true
  puts 'ACCEPTED'
else
  puts 'DENIED'
end

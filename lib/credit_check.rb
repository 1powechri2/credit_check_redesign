class CreditCheck

    attr_reader :numb,
                :numb_doubled

  def initialize(numb = 0)
    @numb         = numb.digits.reverse
    @numb_doubled = []
  end

  def find_amex_from_other
    @numb.length.odd?
  end

  def double_card_numbers
    if find_amex_from_other == true
      @numb.each_with_index do |nums, index|
        if index.odd?
          @numb_doubled << nums * 2
        else
          @numb_doubled << nums
        end
      end
    else
      @numb.each_with_index do |nums, index|
        if index.even?
          @numb_doubled << nums * 2
        else
          @numb_doubled << nums
        end
      end
    end
  end

  def nums_over_ten_minus_nine
    @numb_doubled.map do |num|
      if num >= 10
        num - 9
      else
        num
      end
    end
  end

  def sum_processed_card_number
    nums_over_ten_minus_nine.sum
  end

  def card_valid?
    sum_processed_card_number % 10 == 0
  end
end

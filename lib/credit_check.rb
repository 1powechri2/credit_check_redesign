class CreditCheck

    attr_reader :numb

  def initialize(numb = 0)
    @numb = numb.digits.reverse
  end

  def doubling_luhn_algorithm_digits
    if @numb.length.odd?
      @numb.each_with_index do |nums, index|
        if index.even?
          @numb << nums * 2
        elsif index.odd?
          @numb << nums
        end
      end
    end
  end
end

require './test/test_helper'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test

  def setup
    @credit_check = CreditCheck.new
    @valid_1      = CreditCheck.new(5541808923795240)
    @valid_2      = CreditCheck.new(4024007136512380)
    @valid_3      = CreditCheck.new(6011797668867828)
    @invalid_1    = CreditCheck.new(5541801923795240)
    @invalid_2    = CreditCheck.new(4024007106512380)
    @invalid_3    = CreditCheck.new(6011797668868728)
    @amex_valid   = CreditCheck.new(342804633855673)
    @amex_invalid = CreditCheck.new(342801633855673)
  end

  def test_credit_checker_exitsts
    assert_instance_of CreditCheck, @credit_check
  end

  def test_init_numb_array_equal_zero_by_default
    assert @credit_check.numb.include? 0
  end

  def test_init_numb_changes_with_argument
    actual = @valid_1.numb
    expected = [5,5,4,1,8,0,8,9,2,3,7,9,5,2,4,0]
    assert_equal expected, actual
  end

  def test_amex_vs_all_other
    assert 13, @amex_invalid.numb.length
    assert 14, @valid_2.numb.length
  end

  def test_doubling_luhn_alorithm_digits
    assert @amex_invalid.numb[0].odd?
    assert @valid_3.numb[0].even?
  end
end

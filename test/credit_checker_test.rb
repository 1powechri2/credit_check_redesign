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

  def test_init_numb_equal_zero_by_default
    assert_equal 0, @credit_check.numb
  end

  def test_init_numb_changes_with_argument
    assert_equal 5541808923795240, @valid_1.numb
  end
end

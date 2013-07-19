# coding: utf-8
require 'money'
require 'juice_brand'
require 'juice_stock'

class VendingMachine
  attr_accessor :stocks

  def initialize
    @stocks = []
    @stocks << JuiceStock.new(JuiceBrand::COKE, 5)
  end

  ACCEPTABLE_MONEY = [Money.ten, Money.fifty, Money.hundred, Money.five_hundred, Money.thousand]

  def vend(money)
    @inserted_money ||= []
    if ACCEPTABLE_MONEY.include?(money)
      @inserted_money << money
      nil
    else
      money
    end
  end

  def amount
    return 0 if @inserted_money.nil?

    @inserted_money.inject(0) do |total, money|
      total += money.value
    end
  end

  def pay_back
    back_money = nil
    unless @inserted_money.nil? || @inserted_money.empty?
      back_money = @inserted_money.dup
    end
    @inserted_money = []
    back_money
  end
end

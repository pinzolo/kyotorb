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

  def can_sell?(brand)
    stock = find_stock(brand)
    return false unless stock

    stock.count > 0 && amount >= brand.price
  end

  def sell(brand)
    return nil unless can_sell?(brand)

    stock = find_stock(brand)
    stock ? stock.get : nil
  end

  def add_stock(brand, count)
    stock = find_stock(brand)
    if stock
      stock.count += count
    else
      @stocks << JuiceStock.new(brand, count)
    end
  end

  def buyable_juices
    @stocks.select { |stock| stock.count > 0 && amount >= stock.juice_price }.map(&:brand)
  end

  private
  def find_stock(brand)
    @stocks.find { |s| s.brand == brand }
  end
end

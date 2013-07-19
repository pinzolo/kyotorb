# coding: utf-8
class JuiceBrand
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  COKE = JuiceBrand.new("coke", 120)
end

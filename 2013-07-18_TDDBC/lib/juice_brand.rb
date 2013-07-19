# coding: utf-8
class JuiceBrand
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  COKE = JuiceBrand.new("coke", 120)
  RED_BULL = JuiceBrand.new("red bull", 200)
  WATER = JuiceBrand.new("water", 100)
end

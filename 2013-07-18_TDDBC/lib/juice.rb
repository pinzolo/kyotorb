# coding: utf-8
class Juice
  attr_accessor :brand

  def initialize(brand)
    @brand = brand
  end

  def name
    @brand.name
  end

  def price
    @brand.price
  end
end

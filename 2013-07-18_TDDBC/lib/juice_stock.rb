# coding: utf-8
class JuiceStock
  attr_accessor :brand, :count

  def initialize(brand, count)
    @brand = brand
    @count = count
  end

  def get
  end

  def juice_name
    @brand.name
  end

  def juice_price
    @brand.price
  end
end

# coding: utf-8
class JuiceStock
  attr_accessor :brand, :count

  def initialize(brand, count)
    @brand = brand
    @count = count
  end

  def get
    count > 0 ? Juice.new(brand) : nil
  end

  def juice_name
    @brand.name
  end

  def juice_price
    @brand.price
  end
end

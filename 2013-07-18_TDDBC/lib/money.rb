# coding: utf-8
class Money
  attr_accessor :value
  def initialize(value)
    @value = value
  end

  def eql?(other)
    return false if other.nil?
    @value == other.value
  end

  class << Money
    def one
      Money.new(1)
    end

    def five
      Money.new(5)
    end

    def ten
      Money.new(10)
    end

    def fifty
      Money.new(50)
    end

    def hundred
      Money.new(100)
    end

    def five_hundred
      Money.new(500)
    end

    def thousand
      Money.new(1000)
    end

    def five_thousand
      Money.new(5000)
    end

    def ten_thousand
      Money.new(10000)
    end
  end
end

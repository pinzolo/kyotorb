# coding: utf-8
class VendingMachine
  def vend(money)
    @inserted_money ||= []
    @inserted_money << money unless money.nil?
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

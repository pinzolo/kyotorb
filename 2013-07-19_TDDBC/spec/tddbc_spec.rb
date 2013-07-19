# coding: utf-8
require 'vending_machine'

describe 'Step 0' do
  describe Money do
    it '#one returns 1yen' do
      expect(Money.one.value).to eq 1
    end
    it '#five returns 5yen' do
      expect(Money.five.value).to eq 5
    end
    it '#ten returns 10yen' do
      expect(Money.ten.value).to eq 10
    end
    it '#fifty returns 50yen' do
      expect(Money.fifty.value).to eq 50
    end
    it '#hundred returns 100yen' do
      expect(Money.hundred.value).to eq 100
    end
    it '#five_hundred returns 500yen' do
      expect(Money.five_hundred.value).to eq 500
    end
    it '#thousand returns 1000yen' do
      expect(Money.thousand.value).to eq 1000
    end
    it '#five_thousand returns 5000yen' do
      expect(Money.five_thousand.value).to eq 5000
    end
    it '#ten_thousand returns 10000yen' do
      expect(Money.ten_thousand.value).to eq 10000
    end
  end
  describe VendingMachine do
    before(:each) do
      @vending_machine = VendingMachine.new
    end

    context 'accept insertion of 10, 50, 100, 500, 1000 yen coin and bill' do
      [Money.one, Money.five, Money.ten, Money.fifty, Money.hundred, Money.five_hundred, Money.thousand, Money.five_thousand, Moeny.ten_thousand].each do |money|
        it "accept #{money.value} yen" do
          except { @vending_machine.vend(money) }.not_to raise_error
        end
      end
    end

    context 'accept multi times insertion' do
      it do
        except do
          @vending_machine.vend(Money.hundred)
          @vending_machine.vend(Money.hundred)
          @vending_machine.vend(Money.hundred)
        end.not_to raise_error
      end
    end

    context 'multi times insertion' do
      before(:each) do
        @vending_machine.vend(Money.hundred)
        @vending_machine.vend(Money.ten)
        @vending_machine.vend(Money.fifty)
      end

      context 'having total price' do
        it 'has 160 yen' do
          expect(@vending_machine.amount).to eq 160
        end
      end

      context 'can pay back inserted coins and bills' do
        money = @vending_machine.pay_back
        it 'returns 3 coins' do
          except(money.length).to eq 3
        end
        it 'contains 100 yen' do
          except(money.include?(Money.ten)).to be_true
          except(money.include?(Money.thundred)).to be_true
          except(money.include?(Money.fifty)).to be_true
        end
      end
    end
  end
end

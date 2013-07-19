# coding: utf-8
require 'vending_machine'
require 'money'

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
      [Money.one, Money.five, Money.ten, Money.fifty, Money.hundred, Money.five_hundred, Money.thousand, Money.five_thousand, Money.ten_thousand].each do |money|
        it "accept #{money.value} yen" do
          expect { @vending_machine.vend(money) }.not_to raise_error
        end
      end
    end

    context 'accept multi times insertion' do
      it do
        expect do
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
        it 'returns 160 yen' do
          sum = @vending_machine.pay_back.inject(0) do |result, item|
            result += item.value
          end
          expect(sum).to be 160
        end
      end
    end
  end
end

describe 'Step 1' do
  describe VendingMachine do
    before(:each) do
      @vending_machine = VendingMachine.new
    end

    context 'when inserted invalid money' do
      it 'returns inserted money' do
        back = @vending_machine.vend(Money.one)
        expect(back.value).to be Money.one.value
      end
    end

    context 'when inserted valid money' do
      it 'returns nothing' do
        back = @vending_machine.vend(Money.ten)
        expect(back).to be_nil
      end
    end

    context 'valid money are 10, 50, 100, 500, 1000 yen' do
      [Money.ten, Money.fifty, Money.hundred, Money.five_hundred, Money.thousand].each do |m|
        it "returns nothing, when #{m.value} yen insterted" do
          back = @vending_machine.vend(m)
          expect(back).to be_nil
        end
      end
    end

    context 'invalid money are 1, 5, 5000, 10000 yen' do
      [Money.one, Money.five, Money.five_thousand, Money.ten_thousand].each do |m|
        it "returns inserted money(#{m.value} yen)" do
          back = @vending_machine.vend(m)
          expect(back.value).to be m.value
        end
      end
    end
  end
end

describe 'Step 2' do
  before(:each) do
    @vending_machine = VendingMachine.new
  end

  context 'when vending machine initialized' do
    it "has 1 juice brand" do
      expect(@vending_machine.stocks.length).to eq 1
    end

    it "stock juice has 5 stocks" do
      expect(@vending_machine.stocks.first.count).to eq 5
    end

    it "stocked juice brand is coke" do
      expect(@vending_machine.stocks.first.juice_name).to eq "coke"
    end

    it "can get stocked juice price" do
      expect { @vending_machine.stocks.first.juice_price }.not_to raise_error
    end

    it "can get stocked juice name" do
      expect { @vending_machine.stocks.first.juice_name }.not_to raise_error
    end

    it "can get stocked juice count" do
      expect { @vending_machine.stocks.first.count }.not_to raise_error
    end
  end
end

require_relative '../vending_machine'


describe 'playing vending machine' do

  # ACCEPT COINS
  vending_machine1 = VendingMachine.new
  describe 'amounts from coins' do
    it 'displays INSERT COINS if amount is 0' do
      empty_coins_array = []
      expect(vending_machine1.take_coins(empty_coins_array)).to eq "INSERT COINS"
    end

    it 'accepts valid coin types and updates amount' do
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine1.take_coins(valid_coins_array)).not_to eq "INSERT COINS"
    end

    it 'displays correct amount when coins are inserted' do
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine1.take_coins(valid_coins_array)).to eq 80
    end

    it 'rejects invalid coin types and does not update amount' do
      invalid_coins_array = [2.5, 5.0, 6.0]
      expect(vending_machine1.take_coins(invalid_coins_array)).to eq 95
    end
  end

  # SELECT PRODUCT
  vending_machine2 = VendingMachine.new
  describe 'selects product' do
    it 'displays PRICE: <price of item> if amount is not high enough' do
      expect(vending_machine2.select_product("cola")).to eq "PRICE: #{price}"
    end

    xit 'returns product and displays THANK YOU if product is purchased' do
      expect(vending_machine2.select_product("candy")).to eq "THANK YOU"
    end

    xit 'displays INSERT COINS (amount is 0) after a product is purchased' do
      expect(vending_machine2.select_product("chips")).to eq "INSERT COINS"
    end
  end
end

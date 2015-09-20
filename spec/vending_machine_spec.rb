require_relative '../vending_machine'

describe 'playing vending machine' do
  # ACCEPT COINS
  vending_machine = VendingMachine.new
  describe 'amounts from coins' do
    it 'displays INSERT COINS if amount is 0' do
      vending_machine.empty_coins
      empty_coins_array = []
      expect(vending_machine.take_coins(empty_coins_array)).to eq "INSERT COINS"
    end

    it 'accepts valid coin types and updates amount' do
      vending_machine.empty_coins
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine.take_coins(valid_coins_array)).not_to eq "INSERT COINS"
    end

    it 'displays correct amount when coins are inserted' do
      vending_machine.empty_coins
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine.take_coins(valid_coins_array)).to eq 40
    end

    it 'rejects invalid coin types and does not update amount' do
      vending_machine.empty_coins
      invalid_coins_array = [2.5, 5.0, 6.0]
      expect(vending_machine.take_coins(invalid_coins_array)).to eq 15
    end
  end

  # SELECT PRODUCT
  describe 'selects product' do
    it 'displays PRICE: <price of item> if amount is not high enough' do
      vending_machine.empty_coins
      product_name = "cola"
      price = PRODUCTS[product_name]
      vending_machine.take_coins([5.67])
      expect(vending_machine.select_product(product_name)).to eq "PRICE: #{price}"
    end

    it 'returns product and displays THANK YOU if product is purchased' do
      vending_machine.empty_coins
      product_name = "candy"
      vending_machine.take_coins([5.67, 5.67, 2.5, 5.0])
      expect(vending_machine.select_product(product_name)).to eq "THANK YOU: #{product_name}"
    end

    it 'displays INSERT COINS if amount is 0 when user selects a product' do
      vending_machine.empty_coins
      product_name = "candy"
      expect(vending_machine.select_product(product_name)).to eq "INSERT COINS"
    end
  end

  # RETURN COINS
  describe 'returns coins' do
    it 'displays INSERT COINS and returns all coins in vending machine' do
      vending_machine.empty_coins
      vending_machine.take_coins([5.67, 2.5, 5.0])
      expect(vending_machine.return_coins).to eq "INSERT COINS"
    end
  end

  # SOLD OUT
  describe 'is sold out' do
    it 'displays SOLD OUT when an item is sold out' do
      vending_machine.empty_coins
      product_name = "chips"
      expect(vending_machine.select_product(product_name)).to eq "SOLD OUT"
    end
  end
end

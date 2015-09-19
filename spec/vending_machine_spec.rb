require_relative '../vending_machine'


describe 'playing current amount to screen' do
  vending_machine = VendingMachine.new

  describe 'amounts from coins' do
    it 'displays INSERT COINS if amount is 0' do
      empty_coins_array = []
      expect(vending_machine.take_coins(empty_coins_array)).to eq "INSERT COINS"
    end

    it 'accepts valid coin types and updates amount' do
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine.take_coins(valid_coins_array)).not_to eq "INSERT COINS"
    end

    it 'displays correct amount when coins are inserted' do
      valid_coins_array = [5.67, 2.5, 5.0]
      expect(vending_machine.take_coins(valid_coins_array)).to eq 80
    end

    it 'rejects invalid coin types and does not update amount' do
      invalid_coins_array = [2.5, 5.0, 6.0]
      expect(vending_machine.take_coins(invalid_coins_array)).to eq "This coin is invalid: #{coin}"
    end
  end
end

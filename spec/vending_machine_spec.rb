require_relative '../vending_machine'

  # valid_coins_array = [5.67, 2.5, 5]
  # invalid_coins_array = [2.5, 5, 6]

describe 'playing current amount to screen' do
  vending_machine = VendingMachine.new

  describe 'amounts from coins' do
    it 'displays INSERT COINS if amount is 0' do
      empty_coins_array = []
      expect(vending_machine.take_coins(empty_coins_array)).to eq "INSERT COINS"
    end

    xit 'accepts valid coin types and updates amount' do
      expect(take_coins()).to eq ""
    end

    xit 'displays correct amount when coins are inserted' do
      expect(take_coins()).to eq ""
    end

    xit 'rejects invalid coin types and does not update amount' do
      expect(take_coins()).to eq ""
    end
  end
end

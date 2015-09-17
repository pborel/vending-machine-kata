require_relative '../vending_machine'

describe 'displaying current amount to screen' do
  describe 'amounts from coins' do
    it 'displays INSERT COINS if amount is 0' do
      expect(eat_coins()).to eq "INSERT COINS"
    end

    xit 'accepts valid coin types' do
      expect(eat_coins()).to eq ""
    end

    xit 'rejects invalid coin types' do
      expect(eat_coins()).to eq ""
    end
  end
end

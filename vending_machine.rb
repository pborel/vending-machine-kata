# require_relative 'coins_hash'
COINS = {
  "5.67"  =>  25,
  "2.5"   =>  10,
  "5"     =>  5
}

# Just in case there is more than 1 vending machine in the world, I made it a class
class VendingMachine
  def initialize
    @coins = []
    @amount = 0
  end

  # coins_array should be an array of the weight (oz) of each coin
  # usually a database would be used to do this
  def take_coins(coins_array)
    coins_array.each |coin_weight| do
      coin = Coin.new( {weight: coin_weight} )
      coin.is_valid_coin? ? @coins << coin : return_coin(coin)
    end
  end

  # calcuates the total value of all coins in the vending machine
  def calculate_coins_value
    @amount = 0
    @coins.each do |coin|
      @amount += COINS.key(coin.weight)
    end
  end

  # Returns the coin object
  def return_coin(coin)
    p "This coin is invalid: #{coin}"
  end

  # prints the total value of all coins in the vending machine
  def print_coins_value
    calculate_coins_value
    p "INSERT COINS" if @amount == 0
    p @amount
  end

  def run(coins_array)
    take_coins(coins_array)
    print_coins_value
  end
end
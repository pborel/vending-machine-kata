require_relative 'coins_hash'
require_relative 'coin'

# Just in case there is more than 1 vending machine in the world, I made it a class
class VendingMachine
  def initialize
    @coins = []
    @amount = 0
  end

  # coins_array should be an array of the weight (oz) of each coin
  # usually a database would be used to do this
  def take_coins(coins_array)
    coins_array.each do |coin_weight|
      coin = Coin.new( {weight: coin_weight} )
      coin.is_valid_coin? ? @coins << coin : return_coin(coin)
    end

    print_coins_value
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
    return "INSERT COINS" if @amount == 0
    return @amount
  end

end
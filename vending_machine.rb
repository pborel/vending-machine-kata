require_relative 'coins_hash'
require_relative 'products'
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
      @amount += COINS[coin.weight]
    end
  end

  # Returns the coin object
  def return_coin(coin)
    return "This coin is invalid: #{coin.weight}"
  end

  # prints the total value of all coins in the vending machine
  def print_coins_value
    calculate_coins_value
    return "INSERT COINS" if @amount == 0
    return @amount
  end

  def select_product(product_name)
    price = PRODUCTS[product_name]

    return "INSERT COINS" if @amount == 0
    return "PRICE: #{price}" if @amount < price

    @amount -= price
    return "THANK YOU: #{product_name}"
  end
end
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

    display
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

  def select_product(product_name)
    price = PRODUCTS[product_name]["price"]

    if @amount >= price
      @amount -= price
      "THANK YOU: #{product_name}"
    else
      display(price)
    end
  end

  def return_coins
    returned_coins = []

    @coins.length.times do
      returned_coins << @coins.pop
    end

    return returned_coins && display
  end

  # prints the total value of all coins in the vending machine
  def display(price=0)
    calculate_coins_value

    if @amount == 0
      return "INSERT COINS"
    elsif @amount < price
      "PRICE: #{price}"
    else
      @amount
    end
  end

  def empty_coins
    @coins = []
    @amount = 0
  end
end
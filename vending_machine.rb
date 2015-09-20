require_relative 'coins_hash'
require_relative 'products'
require_relative 'coin'

# Just in case there is more than 1 vending machine in the world, I made it a class
class VendingMachine
  def initialize
    @stored_coins = []
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
      store_coins
      "THANK YOU: #{product_name}"
    else
      display(price, product_name)
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
  def display(price=0, product_name=false)
    calculate_coins_value
    stock = product_name ? PRODUCTS[product_name]["stock"] : 1

    if stock < 1
      "SOLD OUT"
    elsif @stored_coins.empty?
      "EXACT CHANGE ONLY"
    elsif @amount == 0
      "INSERT COINS"
    elsif @amount < price
      "PRICE: #{price}"
    else
      @amount
    end
  end

  def store_coins
    @coins.length.times do
      @stored_coins << @coins.pop
    end
  end

  # Assuming the owner of the vending machine wants to eventually get his/her coins out, I made a method to empty the stored coins
  def empty_coins
    emptied_coins = []

    @stored_coins.length.times do
      emptied_coins << @stored_coins.pop
    end

    emptied_coins
    # this also emptys the array but does not return the coins
    # @store_coins.clear
  end
end
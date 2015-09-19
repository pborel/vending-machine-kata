class Coin
  attr_reader :weight

  def initialize(args={})
    @weight = args.fetch(:weight)
  end

  # will refactor later so that vending machine checks if a coin is valid, getting rid of this class entirely
  def is_valid_coin?
    return true if COINS.has_key?(@weight)
    return false
  end
end
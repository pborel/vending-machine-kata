class Coin
  attr_reader :weight

  def initialize(args={})
    @weight = args.fetch(:weight)
  end

  def is_valid_coin?
    return true if COINS.has_key?(@weight)
    return false
  end
end
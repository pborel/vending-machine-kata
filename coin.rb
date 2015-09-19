class Coin
  attr_reader :weight

  def initialize(args={})
    @weight = args.fetch(:weight)
  end

  def is_valid_coin?()
    if @weight == 5.67 || 2.5 || 5
  end
end
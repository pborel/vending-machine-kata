class Coins
  def initialize(args={})
    @weight = args.fetch(:weight)
    @size = args.fetch(:size)
  end

  def is_valid_coin?()
  end
end
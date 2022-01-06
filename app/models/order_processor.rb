class OrderProcessor
  def initialize(cart_items)
    @cart_items = cart_items
  end

  def execute
    @cart_items.destroy_all
  end
end

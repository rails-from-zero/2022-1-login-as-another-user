module ApplicationHelper
  def total_price(cart_items)
    cart_items.map do |cart_item|
      cart_item.book.price
    end.sum
  end
end

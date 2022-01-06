class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_user.cart_items.includes(:book)
  end

  def create
    book = Book.find(params[:book_id])

    current_user.cart_items.create!(book: book)

    redirect_to :cart_items
  end

  def destroy
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy

    redirect_to :cart_items
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!, :ensure_not_delegated

  def create
    OrderProcessor.new(current_user.cart_items).execute

    redirect_to :root, notice: "Thank you, your order has been placed"
  end
end

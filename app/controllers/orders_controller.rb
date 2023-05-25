class OrdersController < ApplicationController
  def create
    cart = Cart.find(params[:cart_id])
    order  = Order.create!(cart: cart, amount: cart.total.to_i, state: 'pending', user: current_user)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items:
      currency: 'myr',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

end


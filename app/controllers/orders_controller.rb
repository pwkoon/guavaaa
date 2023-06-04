class OrdersController < ApplicationController

  def create
    product= Product.find(params[:product_id])
    order  = Order.create!(product: product, product_sku: product.sku, amount: product.price, state: 'pending', user: current_user)
    session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: 'myr',
          unit_amount: product.price_cents,
          product_data: {
            name: product.name,
            description: product.description,
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
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

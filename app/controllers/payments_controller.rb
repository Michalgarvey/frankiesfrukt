class PaymentsController < ApplicationController

  def create
    Stripe.api_key = "sk_test_5PC4MaeswZqRxs1f6teJ1apK"
    token = params[:stripeToken]
    charge = Stripe::Charge.create(
      amount: @product.price*100,
      currency: "sek",
      description: "",
      source: token
    )
    rescue Stripe::CardError => e
      # The card has been declined
    end
  end
  
end

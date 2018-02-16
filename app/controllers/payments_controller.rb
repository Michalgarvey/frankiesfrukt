class PaymentsController < ApplicationController

  def create
    byebug
    @product = Product.find(params[:product_id])
    @user = current_user



    token = params[:stripeToken]
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price*100).to_i,
        currency: "sek",
        description: params[:stripeEmail],
        source: token,
        receipt_email: params[:stripeEmail]
      )

      

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Looks like we've had some issues processing your payment. #{err[:message]}"
    end



  end
end

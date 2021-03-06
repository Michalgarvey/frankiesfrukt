class PaymentsController < ApplicationController

  def create
    # byebug
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

      if charge.paid
        Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
        flash[:success] = "Thanks, your payment was processed successfully"
        UserMailer.payment_recieved(@user, @product).deliver_now
      end



    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Looks like we've had some issues processing your payment. #{err[:message]}"
    end



  end
end

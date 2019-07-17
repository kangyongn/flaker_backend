class Api::V1::StripesController < ApplicationController
  def charges
    Stripe.api_key = ENV['STRIPE_SK']
    @amount = params[:amount]

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount in USD ($).'
      redirect_to new_charge_path
      return
    end

    @amount = (@amount).to_i

    Stripe::Charge.create({
      amount: @amount,
      currency: 'usd',
      source: params[:stripeToken]
    })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def transfers
    Stripe.api_key = ENV['STRIPE_SK']
    @amount = params[:amount]

    user = User.find(params[:id])

    Stripe::Transfer.create({
      amount: @amount,
      currency: 'usd',
      destination: user.stripe_id
    })
  end
end

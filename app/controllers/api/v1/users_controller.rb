class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @token = JWT.encode({user_id: @user.id}, "secret")
      render json: {user: @user, entries: @user.entries, plans: @user.plans, jwt: @token}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def stripe_callback
    stripe_test_client_id = 'ca_EwmL3WIkrp6NYggrQouufNg2VodKcbhW'
    stripe_test_secret_key = Rails.application.credentials.dig(:stripe_sk)

    options = {
      site: 'https://connect.stripe.com',
      authorize_url: '/oauth/authorize',
      token_url: '/oauth/token'
    }

    code = params[:code]
    id = params[:state]
    client = OAuth2::Client.new(stripe_test_client_id, stripe_test_secret_key, options)

    @response = client.auth_code.get_token(code, :params => {:scope => 'read_write'})
    @access_token = @response.token
    @user = User.find(id)
    @user.update!(stripe_id: @response.params['stripe_user_id']) if @response

    redirect_to 'http://localhost:3001'
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    render json: @user
    @user.destroy
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def get_user
    @user = User.find(params[:id])
  end
end

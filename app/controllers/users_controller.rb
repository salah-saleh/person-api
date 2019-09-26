class UsersController < ApplicationController
  # https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
  # TODO: remove index form skip list!
  skip_before_action :authenticate_request, only: [:create, :authenticate, :index]

  def index
    json_response(User.all)
  end

  def create
    user = User.create!(user_params)
    json_response(user)
  end

  def authenticate
    command = AuthenticateUser.call(user_params)

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private

  def user_params
    # whitelist params
    params.permit(:email, :password)
  end

end

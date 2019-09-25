module V1
  module Users
    class UsersController < ApplicationController
      # https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
      skip_before_action :authenticate_request, only: [:create, :authenticate]

      def create
        user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password])
        json_response(user)
      end

      def authenticate
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
          render json: { auth_token: command.result }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
      end

    end
  end
end

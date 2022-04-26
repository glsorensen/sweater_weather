# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
          render json: UserSerializer.user_data(user)
        else
          render json: { error: 'not found' }
        end
      end
    end
  end
end

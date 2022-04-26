class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.user_data(user)
    else
      render json: { error: 'not found' }
    end
  end
end

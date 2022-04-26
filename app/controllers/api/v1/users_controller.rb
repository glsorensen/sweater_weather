class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render json: { error: 'passwords do not match', status: 400 }
    elsif params[:password] == params[:password_confirmation] && User.find_by_email(params[:email]).nil?
      user = User.create(user_params)
      render json: UserSerializer.user_data(user)
    elsif User.find_by_email(params[:email])
      render json: { error: 'email taken', status: 400 }
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :token)
  end
end

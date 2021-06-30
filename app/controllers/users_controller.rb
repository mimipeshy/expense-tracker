class UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  before_action :set_user, only: [:show, :update, :destroy, :create]

  
  def create
    user = User.create!(user_params)
    # auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(
      :username,
      :email,
      :password
    )
  end
end

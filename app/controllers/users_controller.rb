class UsersController < ApplicationController
  # skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # def index
  #   @users = User.all

  #   render json: @users
  # end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(
      :username,
      :email,
      :password
    )
  end
end

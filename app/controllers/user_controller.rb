class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params["name"], email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"])
    @user.save
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
end

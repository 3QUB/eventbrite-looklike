class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params["name"], email: params["email"], password: params["password"], password_confirmation: params["password_confirmation"])
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
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

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    permitted_columns = params.require(:user).permit(:name, :email)
    @user.update_attributes(permitted_columns)

    redirect_to user_path(@user)
  end

  def destroy 
    @user = User.find(params[:id])
    @user.destroy
  
    redirect_to user_index_path, notice: "Delete success"
  end

  def index
    @user = user.all
  end
  
end

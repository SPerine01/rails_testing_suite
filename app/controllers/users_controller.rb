class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "Your account was successfully created."
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Your account was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "Your account was successfully deleted."
  end

  def profile
    @user = current_user
  end

  private
   
  def set_user
    @dog = Dog.find(params[:id])
  end

  
  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :avatar)
  end
end

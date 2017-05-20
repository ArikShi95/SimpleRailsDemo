require_relative '../../app/helpers/sessions_helper'
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
      if @user.save
      flash[:success] = 'Welcome to the sample app'
      log_in @user
      redirect_to user_path(@user)
    else
      flash[:failure] = 'fail to sign up for your account'
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :age, :password)
  end

  def log_in(user)
    session[:user_id] = user.id
  end
  private :user_params

end
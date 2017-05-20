require_relative '../../app/helpers/sessions_helper'
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    password =  Digest::MD5::hexdigest( params[:session][:password])
    puts password
    if user && password == user.password
      log_in user
      redirect_to user
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def log_in(user)
    session[:user_id] = user.id
    puts user.id
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  private :log_in, :log_out
end

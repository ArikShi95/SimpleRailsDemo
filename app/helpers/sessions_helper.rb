require 'cgi/session'
module SessionsHelper
# 登陆制定用户


# 返回当前的登陆用户
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    self.current_user
    !@current_user.nil?
  end

end

class SessionsController < ApplicationController
  def new
  end

  def create
    params = session_params
    user = User.find_by_username(params[:username])
    if (user.present? && user.authenticate(params[:password]))
      session[:current_user] = user
      flash[:notice] = "Logged in Successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Bad username/password"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:current_user)
    flash[:notice] = "Logged out Successfully!"
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end

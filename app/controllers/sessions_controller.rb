class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end
end

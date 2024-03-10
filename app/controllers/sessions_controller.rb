class SessionsController < ApplicationController
  def new
    # This will render the login form
  end

  before_action :redirect_if_logged_in, only: [:new, :create]

private

def redirect_if_logged_in
  redirect_to root_path, notice: "You are already signed in." if user_signed_in?
end
  def create
    user = User.find_by(email: params[:email])


    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to places_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
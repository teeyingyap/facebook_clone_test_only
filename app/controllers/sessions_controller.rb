class SessionsController < ApplicationController
  def new 
  end

  def create
  	user = User.find_by(email: params[:session][:email])  # Check if the user exists
    if user.try(:authenticate, params[:session][:password]) 
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      flash[:notice] = "Welcome, joshhhh@nextacademy.com!"
      redirect_to statuses_path
    else
      session[:user_id] = nil
      flash[:alert] = "Please log in again"
      render template: "sessions/new"
    end 
  end 

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end

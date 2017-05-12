class UsersController < ApplicationController

  def index
    @user = User.all 
  end 

 
  def new
  	@user = User.new 
  	render template: "users/new"
  end 

  def create
  	@user = User.new(user_from_params)

  	  if @user.save
  	  	flash[:notice] = "Account created. Please log in now."
        redirect_to @user  
      else
      	flash[:alert] = "Error creating account: "
        render template: "users/new"
      end   
  end 

  def edit
  	@user = User.find(params[:id])
  end 

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_from_params)
      flash[:notice] = "Account is updated successfully."
      redirect_to @user
    else
    	render template: "users/edit"
    end 
  end 

  def show
  	@user = User.find(params[:id])
  end 

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Account is deleted"
    redirect_to statuses_path
  end

 def user_from_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end
end

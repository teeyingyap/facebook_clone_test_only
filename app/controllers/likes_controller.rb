class LikesController < ApplicationController

  def create
    status =  Status.find(params[:like][:status])
  	@like = status.likes.new(user_id: params[:like][:user])
    if @like.save
  	  flash[:notice] = "You liked #{status.title}!"
      redirect_to root_path 
    else
      flash[:alert] = "You liked before!"
      redirect_to root_path
    end 
  end 

  def destroy
  	@like = Like.find(params[:id])
    @status = Status.find(@like.status_id)
    @like.destroy
    flash[:notice] = "You unlike."
    redirect_to @status
  end

end

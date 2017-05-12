class StatusesController < ApplicationController

 def index
    @status = Status.all 
  end 

 
  def new
  	@status = Status.new 
  	render template: "statuses/new"
  end 

  def create
  	@status = Status.new(status_from_params)

  	  if @status.save
  	  	flash[:notice] = "Status is created successfully."
        redirect_to @status  
      else
      	flash[:alert] = "Error creating status."
        render template: "statuses/new"
      end   
  end 

  def edit
  	@status = Status.find(params[:id])
  end 

  def update
  	@status = Status.find(params[:id])
    if @status.update_attributes(status_from_params)
      flash[:notice] = "Status is updated successfully."
      redirect_to @status
    else
    	render template: "users/edit"
    end 
  end 

  def show
  	@status = Status.find(params[:id])
  end 

  def destroy
  	@status = Status.find(params[:id])
    @status.destroy
    flash[:notice] = "Status is deleted."
    redirect_to statuses_path
  end

 def status_from_params
   params.require(:status).permit(:title, :content)
 end
end


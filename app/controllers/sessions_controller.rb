class SessionsController < ApplicationController
  def new
  end
  
  def create
    debugger
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log the user in and redirect to the user's show page
    else
      flash.now[:danger] = "Invalid email/password combination" # not quite right
      render :new
    end
  end
  
  def destroy
  end
end

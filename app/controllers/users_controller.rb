class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:error] = "Cannot edit other users"
      redirect_to @user
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end    
  end
  
  def links_index
    @links = current_user.links
  end

end

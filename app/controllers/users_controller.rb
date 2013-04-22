class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Hello Ruby Tuesdays!"
      redirect_to @user
    else
      render 'new'
    end
  end

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

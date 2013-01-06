class LinksController < ApplicationController
 
  def index
    @links = Link.all
  end
 
  def show
    @links = current_user.links
  end
  
  def new
    @link = Link.new
    @obj = @link
  end
  
  def create
    @link = Link.new(params[:link])
    @link.user = current_user
    @obj = @link
    if @link.save
      redirect_to links_path
    else
      render 'new'
    end
  end
  

end

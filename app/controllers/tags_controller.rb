class TagsController < ApplicationController
  def show
    #tag = Tag.find(params[:tag])
    @links = Link.tagged_with(params[:tag])
  end
end
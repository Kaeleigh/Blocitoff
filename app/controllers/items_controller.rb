class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
      redirect_to root_path
    else
      flash[:error] = "Item was not saved. Try again"
      render :new
    end
  end

#closes class
end

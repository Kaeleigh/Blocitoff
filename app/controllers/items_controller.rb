class ItemsController < ApplicationController
  before_action :require_sign_in, only: [:index]

  def index
    if !current_user.nil?
      @user = current_user
      @item = Item.new
      @items = @user.items
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @items = @user.items
    @item = @user.items.new(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "Item was not saved. Try again"
    end
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  #closes class
end

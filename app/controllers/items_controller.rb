class ItemsController < ApplicationController
  # before_action :require_sign_in, only: [:index]

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "Item was not saved. Try again"
    end
    redirect_to user_session_path
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  #closes class
end

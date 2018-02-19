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
    redirect_to root_path
  end

  def destroy
    item = Item.find(params[:id])

    if item.delete
      flash[:notice] = "Item was completed."
    else
      flash[:error] = "There was an error deleting the item, please try again."
    end

    respond_to do |format|
      format.js { render js: current_user }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

  #closes class
end

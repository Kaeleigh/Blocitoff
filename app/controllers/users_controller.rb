class UsersController < ApplicationController

  before_action :require_sign_in

  def show
    if !current_user.nil?
        @user = current_user
        @item = Item.new
        @items = @user.items
      else
        redirect_to new_user_session_path
      end
  end

end

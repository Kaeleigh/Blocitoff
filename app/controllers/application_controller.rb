class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  private

   def require_sign_in
     unless current_user
       flash[:alert] = "You need to be signed in to do that"

       redirect_to new_user_session_path
     end
   end

end

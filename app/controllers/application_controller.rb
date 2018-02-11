class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

   def require_sign_in
     unless current_user
       flash[:alert] = "You need to be signed in to do that"
       redirect_to new_user_session_path
     end
   end

end

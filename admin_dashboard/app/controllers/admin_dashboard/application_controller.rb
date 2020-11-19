module AdminDashboard
  class ApplicationController < ActionController::Base
    include Clearance::Controller
    include Godmin::ApplicationController
    include Godmin::Authentication
    include Godmin::Authorization

    protect_from_forgery with: :exception

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    # Wire up Godmin's controllers and Clearance
    alias_method :authenticate, :require_login
    alias_method :admin_user, :current_user
    alias_method :admin_user_signed_in?, :signed_in?

    private

    def url_after_denied_access_when_signed_out
      main_app.log_in_url
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || main_app.root_path)
    end
  end
end

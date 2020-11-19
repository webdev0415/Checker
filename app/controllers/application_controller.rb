class ApplicationController < ActionController::Base
  include Clearance::Controller
  include Pundit

  before_action :require_login

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def url_after_denied_access_when_signed_out
    log_in_url
  end

  # Workaround to allow Pundit to have access to the request's params
  # read more here https://github.com/varvet/pundit#customize-pundit-user
  def pundit_user
    Struct.new(:user, :params).new(current_user, params)
  end

  # request.referrer gives the previous url
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end

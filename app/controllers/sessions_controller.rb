class SessionsController < Clearance::SessionsController

  private

  def url_after_destroy
    log_in_path
  end

  def url_after_create
    if current_user.superadmin? || current_user.admin?
      admin_dashboard_path
    elsif current_user.investigator?
      investigator_index_path
    else
      root_path
    end
  end
end

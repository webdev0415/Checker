class SignupIdentitiesController < ApplicationController
  skip_before_action :require_login

  def show
    @group = Group.find_by_url(params[:id])

    raise ActionController::RoutingError.new('The url is not valid') if @group.blank?

    @signup_identity = Identity.new(group_id: @group.id)
  end

  def create
    @signup_identity = Identity.new(signup_identity_params)

    if @signup_identity.save
      redirect_to root_path , notice: "Identity was successfully created!"
    else
      render :show
    end
  end

  private

  def signup_identity_params
    params
      .require(:identity)
      .permit(
        :first_name,
        :last_name,
        :birth_day,
        :social_security_number,
        :government_issue_id,
        :group_id,
        :terms_and_conditions
      )
  end
end

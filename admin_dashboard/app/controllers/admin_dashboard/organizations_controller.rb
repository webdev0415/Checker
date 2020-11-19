require_dependency "admin_dashboard/application_controller"

module AdminDashboard
  class OrganizationsController < ApplicationController
    include Godmin::Resources::ResourceController

    def new
      @resource = Organization.new
      @resource.users.build()
    end

    def create
      @resource = Organization.new(resource_params)
      @resource.users.first.role = :organization
      @resource.users.first.password ||= SecureRandom.hex(8) # temporary ramdom password
      @resource.users.first.forgot_password

      if @resource.save
        @user = @resource.users.first

        # Send confirm email after save
        UserMailer.with(organization: @resource, user: @user).confirm_email.deliver_later

        redirect_to organizations_path, notice: "Your organization was successfully created."
      else
        render :new
      end
    end

    private

    def resource_params
      params
        .require(:organization)
        .permit(
          :name,
          :address,
          :contact,
          :start_date,
          :end_date,
          :phone,
          :alert_count,
          :current_fcra_count,
          :current_identity_count_a,
          :current_identity_count_b,
          :current_identity_count_c,
          :current_identity_count_e,
          :current_internal_user_count,
          :list_of_group_ids,
          :list_of_sentinel_profile,
          :list_of_sentry__id_profile,
          :list_of_sentry_risk_profile,
          :signed_agreement_pdf,
          :subscribe_fcra_count,
          :subscribe_internal_user_count,
          :subscribed_identity_count_a,
          :subscribed_identity_count_b,
          :subscribed_identity_count_c,
          :subscribed_identity_count_d,
          users_attributes: [:email]
        )
    end
  end
end

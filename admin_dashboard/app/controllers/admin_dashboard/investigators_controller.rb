require_dependency "admin_dashboard/application_controller"

module AdminDashboard
  class InvestigatorsController < ApplicationController
    include Godmin::Resources::ResourceController

    private

    def resource_params
      params
        .require(:investigator)
        .permit(
          :email,
          :password,
          organization_ids: []
        )
    end
  end
end

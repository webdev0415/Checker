require_dependency "admin_dashboard/application_controller"

module AdminDashboard
  class HomeController < ApplicationController
    before_action { authorize [:admin_dashboard, :home] }

    def index
    end
  end
end

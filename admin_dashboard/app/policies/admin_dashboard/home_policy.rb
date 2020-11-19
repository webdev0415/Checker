module AdminDashboard
  class HomePolicy < AdminDashboard::ApplicationPolicy
    def index?
      user_has_access?
    end
  end
end

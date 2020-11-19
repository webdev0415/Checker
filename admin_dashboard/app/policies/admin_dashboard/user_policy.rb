module AdminDashboard
  class UserPolicy < AdminDashboard::ApplicationPolicy
    def index?
      user_has_access?
    end

    def new?
      user_has_access?
    end

    def create?
      user_has_access?
    end

    def update?
      user_has_access?
    end

    def destroy?
      user_has_access? && (user != record)
    end
  end
end

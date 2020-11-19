module AdminDashboard
  class ApplicationPolicy < Godmin::Authorization::Policy
    def user_has_full_access?
      user.superadmin?
    end

    def user_has_access?
      user.superadmin? || user.admin?
    end

    # Deny access by default
    def index?
      false
    end

    def show?
      false
    end

    def new?
      false
    end

    def create?
      false
    end

    def update?
      false
    end

    def destroy?
      false
    end
  end
end

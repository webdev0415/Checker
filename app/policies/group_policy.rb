class GroupPolicy < ApplicationPolicy
  def index?
    user.organization?
  end

  def create?
    user.organization? && user.organization.id == record.organization_id
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end

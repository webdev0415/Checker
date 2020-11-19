class IdentitiesController < ApplicationController
  def index
    @identities = Identity.joins(group: :organization).merge(current_user.organization.groups)
  end

  def identities
    organization_id = params[:org_id]
    @identities = Organization.find(organization_id).identities
    render 'investigator/identities'
  end
end

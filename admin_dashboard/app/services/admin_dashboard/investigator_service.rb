module AdminDashboard
  class InvestigatorService
    include Godmin::Resources::ResourceService

    attrs_for_index :email, :organizations, :created_at
    attrs_for_show :email, :password
    attrs_for_form :email, :password, :organization_ids


    def create_resource(resource)
      resource.role = "investigator"
      super(resource)
    end

    def resources(params)
      super(params).investigator
    end
  end
end

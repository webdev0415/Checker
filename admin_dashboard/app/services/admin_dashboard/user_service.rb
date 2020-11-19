module AdminDashboard
  class UserService
    include Godmin::Resources::ResourceService

    attrs_for_index :email, :role, :created_at
    attrs_for_show :email, :role
    attrs_for_form :email, :role, :password

    filter :role, as: :select, collection: -> { User::ROLES }, option_text: "name"

    def filter_role(articles, value)
      articles.where(role: value)
    end
  end
end

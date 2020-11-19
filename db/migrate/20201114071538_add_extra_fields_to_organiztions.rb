class AddExtraFieldsToOrganiztions < ActiveRecord::Migration[6.0]
  def change
    remove_column :organizations, :phone
    add_column :organizations, :phone, :string
    add_column :organizations, :email, :string
    remove_column :organizations, :current_identity_count
    add_column :organizations, :current_identity_count_a, :integer
    add_column :organizations, :current_identity_count_b, :integer
    add_column :organizations, :current_identity_count_c, :integer
    add_column :organizations, :current_identity_count_e, :integer
    remove_column :organizations, :subscribed_identity_count
    add_column :organizations, :subscribed_identity_count_a, :integer
    add_column :organizations, :subscribed_identity_count_b, :integer
    add_column :organizations, :subscribed_identity_count_c, :integer
    add_column :organizations, :subscribed_identity_count_d, :integer
    add_column :organizations, :list_of_sentry_risk_profile, :string
    remove_column :organizations, :price
    add_column :organizations, :alert_count, :integer
  end
end

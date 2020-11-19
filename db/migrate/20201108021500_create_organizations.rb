class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.string :address
      t.string :contact
      t.integer :phone
      t.datetime :start_date
      t.datetime :end_date
      t.string :current_identity_count # TODO: review this, looks is better to have integer column
      t.string :subscribed_identity_count
      t.string :list_of_group_ids # TODO: review this
      t.string :list_of_sentry__id_profile
      t.string :list_of_sentinel_profile
      t.integer :current_fcra_count
      t.integer :subscribe_fcra_count
      t.string :current_internal_user_count
      t.integer :subscribe_internal_user_count
      t.integer :price

      t.timestamps
    end
  end
end

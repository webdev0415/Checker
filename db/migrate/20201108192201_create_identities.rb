class CreateIdentities < ActiveRecord::Migration[6.0]
  def change
    create_table :identities do |t|
      t.string :sentry_id_profile
      t.string :sentry_risk_profile
      t.string :list_of_sentinel_profile
      t.string :first_name
      t.string :last_name
      t.date :birth_day
      t.string :social_security_number
      t.boolean :fcra_status
      t.integer :sentry_id_dcore
      t.integer :sentry_rick_score
      t.boolean :alert_flag
      t.string :type_of_alert
      t.string :pfd_report # TODO: change this to use active storage
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :url
      t.boolean :enable_payment, null:false, default: false
      t.references :organization, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class Organization < ApplicationRecord
  has_many :users
  has_many :groups
  has_many :identities, through: :groups
  has_and_belongs_to_many :investigators, class_name: "User", join_table: "organizations_investigators"

  # active storages relations
  has_one_attached :signed_agreement_pdf


  accepts_nested_attributes_for :users

  # validations
  validates :name, :address, :contact, :phone, :start_date, presence: true
end

# == Schema Information
#
# Table name: organizations
#
#  id                            :bigint           not null, primary key
#  address                       :string
#  alert_count                   :integer
#  contact                       :string
#  current_fcra_count            :integer
#  current_identity_count_a      :integer
#  current_identity_count_b      :integer
#  current_identity_count_c      :integer
#  current_identity_count_e      :integer
#  current_internal_user_count   :string
#  email                         :string
#  end_date                      :datetime
#  list_of_group_ids             :string
#  list_of_sentinel_profile      :string
#  list_of_sentry__id_profile    :string
#  list_of_sentry_risk_profile   :string
#  name                          :string           not null
#  phone                         :string
#  start_date                    :datetime
#  subscribe_fcra_count          :integer
#  subscribe_internal_user_count :integer
#  subscribed_identity_count_a   :integer
#  subscribed_identity_count_b   :integer
#  subscribed_identity_count_c   :integer
#  subscribed_identity_count_d   :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

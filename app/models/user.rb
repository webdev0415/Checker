class User < ApplicationRecord
  include Clearance::User
  ROLES = { investigator: 0, organization: 1, admin: 2, superadmin: 3 }

  belongs_to :organization, optional: true
  has_and_belongs_to_many :organizations, join_table: "organizations_investigators"

  enum role: ROLES

  def forgot_password
    generate_confirmation_token
  end

  def superadmin?
    role == 'superadmin'
  end

  def admin?
    role == 'admin'
  end

  def investigator?
    role == 'investigator'
  end

  def organization?
    role == 'organization'
  end
end

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string(128)
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  remember_token     :string(128)      not null
#  role               :integer          default("investigator"), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  organization_id    :bigint
#
# Indexes
#
#  index_users_on_email            (email)
#  index_users_on_organization_id  (organization_id)
#  index_users_on_remember_token   (remember_token)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#

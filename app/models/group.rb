class Group < ApplicationRecord
  belongs_to :organization
  has_many :identities

  # callbacks
  before_save :set_random_url, if: ->(group) { group.url.nil? }

  # validations
  validates :name, :organization, presence: true
  validates :organization, presence: true

  private

  def set_random_url
    loop do
      self.url = SecureRandom.hex(6)
      break unless self.class.exists?(url: url)
    end
  end
end

# == Schema Information
#
# Table name: groups
#
#  id              :bigint           not null, primary key
#  enable_payment  :boolean          default(FALSE), not null
#  name            :string           not null
#  url             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#
# Indexes
#
#  index_groups_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#

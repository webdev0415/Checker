class Identity < ApplicationRecord
  belongs_to :group
  has_one_attached :government_issue_id

  attr_accessor :terms_and_conditions

  # validations
  validates :first_name, :last_name, :birth_day, :government_issue_id, presence: true
  validates :terms_and_conditions, acceptance: true
  validates :social_security_number, presence: true # TODO: ask if we should add "uniqueness: true" here?

  # Helper method to add a logo in Sprig as in: government_file: '<%= sprig_file("some-id.png") %>'
  def government_file=(file)
    government_issue_id.attach(io: file, filename: File.basename(file.path))
  end
end

# == Schema Information
#
# Table name: identities
#
#  id                       :bigint           not null, primary key
#  alert_flag               :boolean
#  birth_day                :date
#  fcra_status              :boolean
#  first_name               :string
#  last_name                :string
#  list_of_sentinel_profile :string
#  pfd_report               :string
#  sentry_id_dcore          :integer
#  sentry_id_profile        :string
#  sentry_rick_score        :integer
#  sentry_risk_profile      :string
#  social_security_number   :string
#  type_of_alert            :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  group_id                 :bigint           not null
#
# Indexes
#
#  index_identities_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#

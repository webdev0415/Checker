# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview
  include ApplicationPreviewer

  # Preview this email at http://localhost:3000/rails/mailers/user/confirm_email
  def confirm_email
    organization = Organization.last
    user = organization.users.first
    user.forgot_password
    user.save
    preview(UserMailer.with(organization: organization, user: user).confirm_email)
  end
end

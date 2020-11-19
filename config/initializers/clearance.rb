Clearance.configure do |config|
  config.routes = false
  config.mailer_sender = Rails.application.config.default_from_mail_address
  config.rotate_csrf_on_sign_in = true
  config.allow_sign_up = false
end

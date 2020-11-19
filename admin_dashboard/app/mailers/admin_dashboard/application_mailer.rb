module AdminDashboard
  class ApplicationMailer < ActionMailer::Base
    default from: 'no-reply@idreport.com'
    layout 'mailer'
  end
end

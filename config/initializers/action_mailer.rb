# change the default view folder when put the emails
ActionMailer::Base.prepend_view_path("app/views/email_templates")

module ApplicationPreviewer
  private

  def preview(mail)
    ActionMailer::InlineCssHook.delivering_email(mail)
  end
end

class DemoMailer < ApplicationMailer
  def demo
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

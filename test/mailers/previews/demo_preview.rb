# Preview all emails at http://localhost:3000/rails/mailers/demo
class DemoPreview < ActionMailer::Preview
  include ApplicationPreviewer

  # Preview this email at http://localhost:3000/rails/mailers/demo/demo
  def demo
    preview(DemoMailer.demo)
  end
end

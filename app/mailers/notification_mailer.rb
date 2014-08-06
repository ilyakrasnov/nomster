class NotificationMailer < ActionMailer::Base
  default from: "no-reply@ilad-nomster.com"

  def comment_added
  	mail(to: "ilya.krasnov@gmail.com", subject: "A comment has been added to your place")
  end
end

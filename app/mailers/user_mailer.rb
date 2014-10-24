class UserMailer < ActionMailer::Base
  default from: "admin@shoutr.com"

  def follow_notification(user, follower)
    @follower = follower
    mail(to: user.email, subject: "You Have a New Follower!")
  end
end

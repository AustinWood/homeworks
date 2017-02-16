class UserMailer < ApplicationMailer
  default from: 'austin@austinkwood.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: 'austin@austinkwood.com', subject: 'Welcome to 99Cats!')
  end

end

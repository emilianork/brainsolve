class Notifier < ActionMailer::Base
  default from: "brainsolve.c@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.send_notification.subject
  #
  def send_notification(solution)
    @solution = solution
    @user = @solution.user
    @problem = @solution.problem
    @path = "http://lvh.me:3000" if Rails.env == "development"
    @path = "http://emilianork.me" if Rails.env == "production"

    attachments.inline['cerebro_logo.png'] = File.read('public/cerebro_logo.png')

    mail to: @user.email, subject: 'Brainsolve - Notificación'
  end
end

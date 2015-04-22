class Mailer < ActionMailer::Base
  def message
    mail(
      :subject => 'Your schedule link',
      :to  => 'zjsmith@colgate.edu',
      :from => 'Cosc480project@postmark.com',
      :html_body => '<strong>Hello</strong> ,here is your link',
      :track_opens => 'true')
  end
end

class FeedbacksMailer < ApplicationMailer
  default to: %("TestGuru Project" <crrafterr17@gmail.com>)

  def feedback_email(feedback)
    @name = feedback.name
    @email = feedback.email
    @body = feedback.body

    mail from: @email
  end
end

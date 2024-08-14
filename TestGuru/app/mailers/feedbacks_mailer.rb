class FeedbacksMailer < ApplicationMailer
  def feedback_email(feedback)
    @name = feedback.name
    @email = feedback.email
    @body = feedback.body

    mail from: @email
  end
end

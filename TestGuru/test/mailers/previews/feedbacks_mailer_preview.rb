class FeedbacksMailerPreview < ActionMailer::Preview
  def feedback_email
    feedback = Feedback.new(name: 'test', email: 'test@test.test', body: 'test body')

    FeedbacksMailer.feedback_email(feedback)
  end
end

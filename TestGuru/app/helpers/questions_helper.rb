module QuestionsHelper
  def question_header(test, question)
    return "Create New #{test.title} Question" if question.new_record?

    "Edit #{test.title} Question"
  end
end

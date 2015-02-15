post '/surveys/:survey_id/questions' do
  puts params

  survey = Survey.find(params[:survey_id])
  question = survey.questions[(params[:question_id].to_i - 1)]

  if question 
    question.update(content: params[:question][:content], survey_id: params[:survey_id])
  else
    question = Question.create(content: params[:question][:content], survey_id: params[:survey_id])
  end
  
  question.answers.delete_all

  params[:question][:answers].each do |content|
    Answer.create(question_id: question.id, content: content)
  end
end

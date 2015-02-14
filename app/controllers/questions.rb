post '/surveys/:survey_id/questions' do
  question = Question.create(content: params[:question][:content], survey_id: params[:survey_id])
  
  params[:question][:answers].each do |content|
    Answer.create(question_id: question.id, content: content)
  end
end

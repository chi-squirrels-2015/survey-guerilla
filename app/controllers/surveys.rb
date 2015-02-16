get '/surveys/all' do
  @surveys = Survey.all
  erb :"/surveys/all"
end

get '/surveys/new' do
  erb :"/surveys/new"
end

post '/surveys' do
  # will change to use current user. hard-coded to uid 3 for now
  survey = Survey.create(creator: current_user, title: params[:survey][:title], description: params[:survey][:description])
  # What is the benifit of checking the XHR (AJAX call)?
  content_type :json
  {id: survey.id}.to_json
end

put '/surveys/:survey_id/edit' do
  survey = Survey.find(params[:survey_id])
  survey.update(title: params[:survey][:title], description: params[:survey][:description])
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :'surveys/show'
end

post '/surveys/:survey_id/records' do
  record = Record.create(respondent: current_user, survey_id: params[:survey_id])
  answers_ids = params[:answers].values

  answers_ids.each { |answer_id| Response.create(answer_id: answer_id, record: record) }

  redirect "/"
end

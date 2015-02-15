get '/surveys/new' do
  erb :"/surveys/new"
end

post '/surveys' do
  # will change to use current user. hard-coded to uid 3 for now
  survey = Survey.create(creator_id: 3, title: params[:survey][:title], description: params[:survey][:description])
  # What is the benifit of checking the XHR (AJAX call)?
  content_type :json
  {id: survey.id}.to_json
end

put '/surveys/:survey_id/edit' do
  survey = Survey.find(params[:survey_id])
  survey.update(title: params[:survey][:title], description: params[:survey][:description])
end

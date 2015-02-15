get '/users/:id' do
  @user = User.find(params[:id])
  @surveys = Survey.where(creator_id: params[:id])

  erb :'/users/profile'
end



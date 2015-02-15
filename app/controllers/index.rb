# renders the index page
get '/' do
  @five_most_recent_surveys = Survey.order(created_at: :desc).limit(5)

  erb :index
end

#renders the /logins page
get '/logins' do
  erb :"/logins"
end

# receives email address & plain text password
post '/logins' do

  # this is the one line, super awesome password
  # authentication provided by BCrypt
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

  if user # if the user is in the database and authenticated
    session[:user_id] = user.id
    redirect '/'
  else # if the user is not authenticated
    @error = "try again"
    erb :"/logins"
  end
end

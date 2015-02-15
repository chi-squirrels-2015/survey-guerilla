get '/' do
  erb :"/index"
end

post "/userlogin" do
  @click = params[:click]

  if @click == "signin"
    erb :"/users/signin", layout: false

  elsif @click == "signup"
    erb :"/users/new", layout: false

  end
end

post '/users/signin' do

  # this is the one line, super awesome password
  # authentication provided by BCrypt
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

  if @user # if the user is in the database and authenticated
    session[:user_id] = @user.id
    redirect '/'
  else # if the user is not authenticated
    @error = "try again"
    redirect '/'
  end
end

get '/users/logout' do
  session.clear

  redirect '/'
end

post '/users/signup' do

  if params[:password] != params[:password_confirmation]
    redirect '/'
  else
    user = User.new(     name: params[:name],
                        email: params[:email],
                     password: params[:password],
        password_confirmation: params[:password_confirmation])
    if user.save
      redirect '/'
    else

    end
  end



end


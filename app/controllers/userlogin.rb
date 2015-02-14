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

post '/users/login' do

  # this is the one line, super awesome password
  # authentication provided by BCrypt
  @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])

  if @user # if the user is in the database and authenticated
    session[:user_id] = @user.id
    redirect '/'
  else # if the user is not authenticated
    @error = "try again"
    erb :"/userlogin"
  end
end

get '/userlogout' do
  session.clear
end

post '/users/new' do

  if params[:password] != params[:password_confirmation]
    @click = "signup"
    erb :"/users/new"
  else
    raise "In ELSE"
    User.new(name: params[:name], email: params[:email], password: params[:password, password_confirmation: params[:password_confirmation]])
    if User.save
      redirect '/'
    else

    end
  end



end


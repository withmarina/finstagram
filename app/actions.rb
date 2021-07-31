# get '/' do
#     File.read(File.join('app/views', 'index.html'))
# end

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  # @current_user = User.find_by(id: session[:user_id])
  erb(:index)
end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end

get '/login' do
  erb(:login)
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

post '/signup' do
  email      = params[:email]
  avatar_url = params[:avatar_url]
  username   = params[:username]
  password   = params[:password]

  @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

  if @user.save
    redirect to('/login')
  else
    erb(:signup)
  end
end


post '/login' do
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username) #find user by username

  if @user && @user.password == password #if user exists and password matches
    session[:user_id] = @user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end
# username-password combos for testing:
# user: a_fish_doesnt_catfish, password: a
# user: nemo, password: findme

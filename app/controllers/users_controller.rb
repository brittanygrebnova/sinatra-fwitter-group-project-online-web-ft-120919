class UsersController < ApplicationController

    get '/' do
        erb :index
    end
    
    get '/signup' do 
        erb :'users/new'
    end

    post '/signup' do 
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        redirect "/tweets"
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user != nil && @user.authenticate(params[:password])
            session[:user_id] = @user.id
        end
        # binding.pry
        if logged_in?
            redirect "/tweets"
        else 
            redirect '/signup'
        end
    end

    
    get '/tweets' do
        erb :'users/tweets'
    end


    

end

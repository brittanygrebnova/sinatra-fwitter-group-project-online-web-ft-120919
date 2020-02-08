class UsersController < ApplicationController

    get '/' do
        erb :index
    end
    
    get '/signup' do
        # binding.pry
        if logged_in?
            # binding.pry
            redirect '/tweets'
        else 
            erb :'users/new'
        end
    end

    post '/signup' do 
        # binding.pry
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if !params[:username].empty? && !params[:email].empty? && !params[:password].empty? 
            @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        end 

        if @user.save
            session[:user_id] = @user.id
            # binding.pry
            redirect "/tweets"
        else
            redirect '/signup'
        end
    end

    get '/login' do
        
        if logged_in?
            redirect "/tweets"
        else 
            erb :'/users/login'
        end
    end

    post '/login' do
        binding.pry
        @user = User.find_by(:username => params[:username])
        if @user != nil && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/tweets"
        end
    end

    get '/tweets' do
        erb :'users/tweets'
    end

    get '/logout' do
        if logged_in?
            session.clear
        # else
        #     redirect ''
        end
    end




    

end

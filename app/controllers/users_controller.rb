class UsersController < ApplicationController
    get '/signup' do 
        if logged_in?
            redirect '/plots'
        else
            erb :'users/signup'
        end
    end

    post '/signup' do 
        user = User.new(params)

        if user.save
            session[:user_id] = user.id
            redirect "/plots"
        else
            redirect "/signup"
        end
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/plots'
        else
            redirect to '/'
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end

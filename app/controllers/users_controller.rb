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
        if logged_in?
            redirect '/plots'
        else
            erb :'users/login'
        end
        
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/plots'
        else
            redirect '/'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end

# if logged_in?
#     
# else
#     
# end

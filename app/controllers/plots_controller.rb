class PlotsController < ApplicationController
    get '/plots' do 
        if logged_in?
            @user = current_user
            @plots = current_user.plots
            erb :'plots/index'
        else
            redirect '/'
        end
    end
end

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

    get '/plots/new' do
        if logged_in?
            erb :'plots/new'
        else
            redirect '/'
        end
    end

    post '/plots' do
        plot = current_user.plots.build(params).save #use AR association method to build collection
        if plot 
            redirect "/plots/#{plot.id}"
        else
            redirect '/plots/new'
        end
    end

    get '/plots/show' do

    end


end

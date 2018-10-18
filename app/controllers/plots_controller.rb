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
        if logged_in?
            plot = current_user.plots.build(params) #use AR association method to build plot
            if plot.save
                redirect "/plots/#{plot.id}"
            else
                redirect '/plots/new'
            end
        else
            redirect '/'
        end

    end

    get '/plots/:id' do
        @plot = Plot.find_by_id(params[:id])
        erb :'plots/show'
    end


end

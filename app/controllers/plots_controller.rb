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

    get  '/plots/:id/edit' do
        if logged_in?   
            @plot = Plot.find_by_id(params[:id])
            if @plot    #make sure plot exists in case someone types in wrong :id/edit
                if @plot.user == current_user
                    erb :'/plots/edit'
                else
                    redirect "/plots/#{@plot.id}" #go to show page
                end 
            else
                redirect "/plots"
            end
        else
            redirect '/'
        end
    end

    patch '/plots/:id' do

    end

    delete '/plots/:id' do
        if logged_in?
            @plot = Plot.find_by_id(params[:id])
            if @plot && @plot.user == current_user #must be able to find plot AND it belongs to current user
                @plot.delete
            end
            redirect to '/plots'
        else
            redirect to '/' 
        end
    end

        #show
    get '/plots/:id' do
        @plot = Plot.find_by_id(params[:id])
        erb :'plots/show'
    end
end

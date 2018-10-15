class PlotsController < ApplicationController
    get '/plots' do 
        erb :'plots/index'
    end
end

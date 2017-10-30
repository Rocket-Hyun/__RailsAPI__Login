class UsersController < ApplicationController
    def signup
        @user = User.new
        @user.email = params[:email]
        @user.password = params[:password]
        @user.save
        
        render json: @user
    end
end

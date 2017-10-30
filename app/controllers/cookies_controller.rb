class CookiesController < ApplicationController
    def index
        if (@user = User.find_by(email: cookies[:email])) || (@user = User.find_by(email: params[:email]))
            if (@user.authenticate(params[:password])) || (@user.authenticate(cookies[:password]))
                if params[:password]
                    cookies[:email] = params[:email]
                    cookies[:password] = params[:password]
                end
                @msg = @user
            else
                @msg = {message: "Wrong Password!"}
            end
        else
            @msg = {message: "No user!"}
        end
        render json: @msg
    end
end

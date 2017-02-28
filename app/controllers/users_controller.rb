class UsersController < ApplicationController

def new
    @user = User.new
end


def create
        @user = User.new user_params
        if @user.save  #if it saves we flash a message and redirect to the home
            flash[:success] = "User created successfully"
            session[:user_id] = @user.id  #LOG IN STRAIGHT AWAY AFTER THE USER SIGN IN
            redirect_to incoming_messages_path

            
        else 
            render 'new' #render again the user creation page in case of failure during the save 
        end
    end

     private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation) #alternatively coul set to all instead of naming all the params
    end


end

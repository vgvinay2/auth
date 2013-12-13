class UsersController < ApplicationController
  
        def new
          @user = User.new
        end
      
        def home
        end
      
        def news
        end
      
        def contact
        end
      
        def about
        end

        def create
          @user = User.new(user_params) # do not search this method anywhere 1: User.new 2: usser.save
            if @user.save
              redirect_to new_user_path ,:notice => "You have successfully filled you profile!!!"
            else
              render "new"
            end
        end

        private
      
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
        
        
end


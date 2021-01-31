class ApplicationController < ActionController::Base

    helper_method :is_admin!

    private

    def is_admin!
        if current_user && current_user.is_admin
        else
        redirect_to root_path 
        end
end

class UsersController < ApplicationController
    def current_user
        User.first
    end
end

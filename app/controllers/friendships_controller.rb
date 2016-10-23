class FriendshipsController < ApplicationController

    def new
    end

    def create
        
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
            flash[:notice] = "Added friend."
            redirect_to root_path
        else
            flash[:error] = "This person is already your friend"
            redirect_to users_path
        end
    end


end
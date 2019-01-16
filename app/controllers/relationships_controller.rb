class RelationshipsController < ApplicationController
before_action :find_user


 #respond_to :html, :js

  def create
    current_user.follow(@user)
    redirect_to :back
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to :back
  end
  
  
  def find_user
    @user= User.find(params[:user_id])
end
end 
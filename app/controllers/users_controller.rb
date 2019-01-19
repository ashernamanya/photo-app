class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :show, :followers, :following]

def index
 @users = User.all
end

def show
 @user = User.find(params[:id])
 @user_tweets = @user.tweets.paginate(page: params[:page], per_page: 5)
end

def followers
  @user = User.find(params[:id])
     @followers = @user.followers(User)
     @users = User.paginate(page: params[:page], per_page: 5)

     response = {:user => @user, :followers => @followers, :users => @users}

     respond_to do |format|
      format.html  #followers.html.erb
      format.xml {render :xml => response}
    end
end

def following
 @user = User.find(params[:id])
     @following = @user.followers(User)
    @users = User.paginate(page: params[:page], per_page: 5)

     response = {:user => @user, :following => @following, :users => @users}

     respond_to do |format|
      format.html  #following.html.erb
      format.xml {render :xml => response}
    end
end 


def show_followers
@user = User.find(params[:id])
     @following = @user.followers(User)
    @users = User.paginate(page: params[:page], per_page: 5).order('RANDOM()').limit(5)

     response = {:user => @user, :following => @following, :users => @users}

     respond_to do |format|
      format.html  #following.html.erb
      format.xml {render :xml => response}
    end
end  

def destroy

@user = User.find(params[:id])

@user.destroy

flash[:danger] = "User and all articles created by user have been deleted"

redirect_to users_path
end

 def search
    @user = User.all.order('RANDOM()').limit(5)
   
  end
  
def online?
    if current_logged_in_at.present? 
      last_sign_out_at.present? ? current_sign_in_at > 

last_sign_out_at : true
    else
      false
    end
end 


private

def user_params

params.require(:user).permit(:username, :country, :email, :password)

end

def set_user

@user = User.find(params[:id])
end 

def set_follower
 @user=User.find(params[:id])

end

# def require_same_user

# if current_user != @user and !current_user.admin?

# flash[:danger] = "You can only edit your own account"

# redirect_to root_path

# end

# end


#def set_user
    #@user = User.find_by(username: params[:username])
    

# def require_admin

# if logged_in? and !current_user.admin?

# flash[:danger] = "Only admin users can perform that action"

# redirect_to root_path

# end
# end 
# end 
# end 

  def my_friends
    @friendships = current_user.friends
  end
  
  def search
    @users = User.search(params[:search_param])
    if @users
      @users = current_user.except_current_user(@users)
      render partial: "friends/lookup"
    else
      render status: :not_found, nothing: true
    end
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    if current_user.save
      redirect_to my_friends_path, notice: "Friend was successfully added"
    else
      redirect_to my_friends_path, flash[:error] = "There was an error with adding user as friend"
    end
  end
 
    #@user_stocks = @user.stocks
  end
end




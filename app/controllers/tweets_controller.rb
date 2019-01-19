class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show ]


def index
@tweets= Tweet.all
end 
   
 def new
 @tweet = Tweet.new
 end
 
 def create
 @tweet = Tweet.new(tweet_params)
 @tweet.user=current_user
 if @tweet.save
     flash[:success]= "Reciped"
 redirect_to tweet_path(@tweet)
 else
 render ‘new’
 end
end 

def show
 render template: 'tweets/show'
 #@tweet=Tweet.find(params[:content])

end 

private
 
def set_tweet 
    @tweet=Tweet.find(params[:id])
end

def tweet_params
 params.require(:tweet).permit(:content, :id)
end
end 




  
 

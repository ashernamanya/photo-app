class ArticlesController <ApplicationController
    
    before_action :set_article, only: [:edit, :update, :suggestions, :show, :destroy]
    # before_action :require_user, except: [:index, :show,]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
   def index
    @articles = Article.paginate(page: params[:page], per_page: 5).order('RANDOM()').limit(5)
   
    #@articles = Article.of_followed_users(current_user.following).order('created_at DESC').page params[:page]
    
     #@articles = Article.search(params[:search])
end 
    
 
def new
        
    @article = Article.new
    end 
    
    def edit 
     @article = Article.find(params[:id])  
        
    end 
    
def create

 @article = Article.new(article_params)
 @article.user= current_user
if @article.save
@article.create_activity :create, owner: current_user
flash[:success] = "Article was successfully created"
 redirect_to article_path(@article)
 
 else
 render 'new'
 
end
end

def update
    
    if @article.update(article_params)
        flash[:success]= "Article was successfully updated"
        redirect_to article_path(@article)
    else 
    
    render 'edit'
end
end 

def suggestions
 #@articles=Article.find(params[:id])
 @articles = Article.paginate(page: params[:page], per_page: 1).order('RANDOM()').limit(1)
  end   
  
def show
    @article=Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id

end 


def destroy 
    
    @article.destroy
        flash[:danger]= "Article was successfully deleted"
    redirect_to article_path(@article)
    
def search 
 @articles = Article.all
  if params[:id]
    @articles = Article.search(params[:id]).order("created_at DESC")
  else
    @articles = Article.all.order("created_at DESC")
  end
end
end 

    
private

def  set_article 
    @article=Article.find(params[:id])
end 

def article_params

params.require(:article).permit(:tittle, :description, :search,)
end
#  def require_same_user
#     if current_user != @article.user and !current_user.admin?
#          flash[:danger]= " You have no permission to delete this article."
#          redirect_to root_path
#   end 
   
  end
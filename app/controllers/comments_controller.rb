class CommentsController < ApplicationController
def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:article_id]
   @comment.save 
   #@comment.create_activity :create, owner: current_user
#  #create_notification @article, @comment
#       respond_to do |format|
#         format.html { redirect_to article_path }
#         format.js
#       end
redirect_to article_path(@comment.article)
end 

  def edit
    @comment = Comment.find(params[:id])
  end

 def update
   @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
        flash[:success] = "Successfully updated..."
   redirect_to article_path
    else
      render :edit
    end
 end
  
  def destroy 
       @article=Article.find(params[:id])
      @comment=@Article.comments.find(params[:id])
      @comment.destroy
      
  end

 
 
# def create_notification(article, comment)#this notifies the user on articles and comments made on the website
# 	return if article.user.id == current_user.id 
#     Notification.create(user_id: article.user.id,
#                         notified_by_id: current_user.id,
#                         artice_id: article.id,
# 			            comment_id: comment.id,
#                         notice_type: 'comment')
# end
private
def comment_params
params.require(:comment).permit(:name, :body)


end 
end 


class CommentsController < ApplicationController
  before_action :require_user

  def create
   @post = Post.find(params[:post_id])
   @comment = @post.comments.build(comment_params)
   @comment.creator = current_user

   if @comment.save
     flash[:notice] = 'comment saved' 
     redirect_to post_path(@post) 
   else 
    render 'posts/show'
   end
  end

  def vote
    @comment = Comment.find(params[:id])  
    vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
    if vote.errors.size == 0
      flash[:notice] = 'Your vote was counted'
    else
      flash[:error] = 'You already voted on this'
    end
    # redirect_to :back     deprecated in rails 5 in favor of redirect_back
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
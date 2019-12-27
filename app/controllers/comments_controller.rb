class CommentsController < ApplicationController
  expose :post, -> { Post.find(params[:post_id]) }
  expose :comment, build: -> (comment_params) { post.comments.new(comment_params) }

  def create
    comment.user = current_user
    comment.save
  end

  def update
    comment.update(comment_params) if current_user&.author_of?(comment)
    @post = comment.post
  end

  def destroy
    comment.destroy if current_user&.author_of?(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end

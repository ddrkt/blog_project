class CommentsController < ApplicationController
  expose :post, -> { Post.find(parans[:post_id]) }
  expose :comment, build: -> (cpmment_params) { posts.comments.new(comment_params) }

  def create
    comment.user = current_user
    comment.save
  end

  def update
    comment.update(comment_params) if current_user&.author_of?(comment)
  end

  def destroy
    comment.destroy if current_user&.author_of?(comment)
  end

  private

  def comments_params
    params.require(:post).permit(:name, :body, :publish, :draft, :created_at, :updated_at, :user_id)
  end
end

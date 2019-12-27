class PostsController < ApplicationController
  expose :posts, ->{ Post.all }
  expose :post, build: -> (post_params){ current_user.posts.new(post_params) }
  expose :comment, -> { post.comments.new }

  def create
    if post.save
      redirect_to post_path(post), notice: 'noice'
    else
      render :new
    end
  end

  def update
    if post.update(post_params)
      redirect_to post_path(post), notice: '123'
    else
      render :edit
    end
  end

  def destroy
    post.destroy if current_user&.author_of?(post)
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :publish, :draft, :created_at, :updated_at, :user_id)
  end
end

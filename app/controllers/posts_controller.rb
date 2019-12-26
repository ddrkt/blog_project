class PostsController < ApplicationController
  expose :posts, ->{ Post.all }
  expose :post, build: -> (post_params){ current_user.posts.new(post_params) }

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
    thing.destroy
    redirect_to things_path
  end

  private

  def post_params
    params.require(:post).permit(:name, :body, :publish, :draft, :created_at, :updated_at, :user_id)
  end
end

require_relative '../models/post'
require_relative '../views/posts_view'

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    post = Post.all
    @view.list(post)
    # TODO: implement listing all posts
  end

  def create
    # TODO: implement creating a new post
    post_info = @view.add_to_db
    new_post = Post.new(post_info)
    new_post.save
    index
  end

  def update
    index
    id_info = @view.ask_for(:id)
    post = Post.find(id_info.to_i)
    title = @view.ask_for(:title)
    info = @view.ask_for(:url)
    post.title = title
    post.url = info
    post.save
    index
  end

  def destroy
    index
    # TODO: implement destroying a post
    id_info = @view.destroy_from_db
    find_id = Post.find(id_info[:id])
    find_id.destroy
    index
  end

  def upvote
    index
    id_info = @view.upvote
    updated_post = Post.find(id_info[:id])
    updated_post.votes += 1
    updated_post.save
    index
  end
end

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @post = Post.new
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def confirm
    @post = Post.new(content: params[:content])
    render :new if @post.invalid?
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]="投稿を作成しました！"
      redirect_to posts_index_path
    else
      render new
  end
end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
     flash[:notice] = "投稿を編集しました！"
     redirect_to("/posts/index")
    else
     render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice]="投稿を削除しました！"
    redirect_to("/posts/index")
    end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
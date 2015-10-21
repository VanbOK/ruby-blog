class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
    @post = Post.new()
  end

  def create
  	params.permit!
    @post = Post.new(params[:post])  #создаем модель и наполняем данными формы

    @post.save    # сохраняем модель
    redirect_to @post    #переадресовываем на страницу отображения поста
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    params.permit!
    @post = Post.find(params[:id])

    if @post.update(params[:post])
      redirect_to @post
    else
      render 'edit'
    end
  end

def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

end

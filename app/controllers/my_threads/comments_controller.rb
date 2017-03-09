class MyThreads::CommentsController < ApplicationController
  before_action :set_my_thread
  before_action :set_my_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @my_thread.comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.my_thread = @my_thread
    @comment.save
    redirect_to my_thread_comments_path(@my_thread.id)
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to my_thread_comments_path(@my_thread.id)
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to my_thread_comments_path(@my_thread.id)
  end

  private
     def set_my_thread
       @my_thread = MyThread.find(params[:my_thread_id])
     end

     def set_my_comment
       @comment = Comment.find(params[:id])
     end

     def comment_params
       params[:comment].permit(:text)
     end

end

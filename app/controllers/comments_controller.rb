class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new 
  end

  def create
    @message.new(text: params[:message][:text])
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end
end

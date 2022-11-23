class CommentsController < ApplicationController
  def create
    
    @prototype = Prototype.find(params[:prototype_id]) 
    @comment = @prototype.comments.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@prototype) # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end
    private
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
    end
end

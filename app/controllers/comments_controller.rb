class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy show]
  before_action :authenticate_user!
  before_action :set_submission

  def new;
  end

  def show;
  end

  def create
    @comment = Submission.comments.create(params[:comment].permit(:reply, :submission_id))
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to submission_path(@submission), notice: 'Comment was successfully created.' }
        format.js # renders create.js.erb in app/views/comments
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html do
          redirect_to submission_path(@submission),
                      notice: 'Your comment could not be saved. Please try again.'
        end
      end
      format.js
      format.json do
        render json: @comment.errors,
                status: :unprocessable_entity
      end
    end
  end
end

def edit;
end

def update;
  respond_to do |format|
    if @comment.update(comment_params)
      format.html do
        redirect_to submission_path(@submission),
                    notice: 'Your comment was successfully updated.'
      end
    else
      format.html { render :edit }
      format.json { render json: @comment.errors, status: :unprocessable_entity}
    end
  end
end

def destroy;
  @comment.destroy
  redirect_to submission_path(@submission)
end

private

def set_submission
  # Retrieve the submission
  @submission = Submission.find(params[:submission_id])
end

def set_comment
  # Retrieve the comment
  @comment = @submission.comments.find(params[:id])
end

# Require a comment and only permit reply
def comment_params
  params.require(:comment).permit(:reply)
end

end
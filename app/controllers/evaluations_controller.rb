class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def new
    @evaluation = Evaluation.new
  end

  def create
    # binding.pry
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.user_id = current_user.id
    if @evaluation.save
      flash[:notice] = 'You have created evaluation successfully.'
      redirect_to evaluation_path(@evaluation.id)
    else
      render new_evaluation_path, flash: { error: @evaluation.errors.full_messages }
    end
  end

  def index
    @user = current_user
    @evaluations = Evaluation.page(params[:page]).reverse_order
  end

  def show
    @evaluation = Evaluation.find(params[:id])
    @opinion = Opinion.new
  end

  def search
    if params[:keyword].present?
      @evaluations_count = Evaluation.where('teacher_name LIKE ? or class_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").count
      @evaluations = Evaluation.where('teacher_name LIKE ? or class_name LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%").page(params[:page]).reverse_order
      @keyword = params[:keyword]
    end
  end

  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  def update
    @evaluation = Evaluation.find(params[:id])
    if @evaluation.update(evaluation_params)
      flash[:notice] = "You have updated evaluation successfully."
      redirect_to evaluation_path(@evaluation.id)
    else
      render :edit
    end
  end

  def destroy
    evaluation = Evaluation.find(params[:id])
    evaluation.destroy
    flash[:notice] = 'Evaluation was successfully destroyed.'
    redirect_to evaluations_path
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(:teacher_name, :class_name, :evaluation, :easiness, :expectation, :comment)
  end

  def correct_user
    @evaluation = Evaluation.find(params[:id])
    @user = @evaluation.user.id
    redirect_to evaluations_path unless @user == current_user.id
  end

end
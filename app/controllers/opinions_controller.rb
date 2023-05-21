class OpinionsController < ApplicationController

  def create
    evaluation = Evaluation.find(params[:evaluation_id])
    opinion = current_user.opinions.new(opinion_params)
    opinion.evaluation_id = evaluation.id
    if opinion.save
      flash[:notice] = 'You have created comment successfully.'
      redirect_to evaluation_path(evaluation.id)
    else
      redirect_to evaluation_path(evaluation.id), flash: { error: opinion.errors.full_messages }
    end
  end


  def destroy
    Opinion.find_by(id: params[:id]).destroy
    redirect_to evaluation_path(params[:evaluation_id])
  end

  private

  def opinion_params
    params.require(:opinion).permit(:opinion)
  end

end

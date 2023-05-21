class FavoritesController < ApplicationController

  def create
    evaluation = Evaluation.find(params[:evaluation_id])
    favorite = Favorite.new(evaluation_id: evaluation.id)
    favorite.user_id = current_user.id
    # favorite = current_user.favorites.new(evaluation_id: evaluation.id)
    favorite.save
    redirect_to evaluation_path(evaluation)
  end

  def destroy
    evaluation = Evaluation.find(params[:evaluation_id])
    favorite = Favorite.find_by(evaluation_id: evaluation.id)
    favorite.user_id = current_user.id
    # favorite = current_user.favorites.find_by(evaluation_id: evaluation.id)
    favorite.destroy
    redirect_to evaluation_path(evaluation)
  end

end



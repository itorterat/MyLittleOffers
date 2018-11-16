module Offers
  class CommentsController < ApplicationController
  before_action :set_current_user, only: [:create]
  before_action :set_current_offer, only: [:create]

    def create
      new_comment_params = comment_params.merge(user_id: @current_user.id).merge(offer_id: @current_offer.id)
      @comment = Comment.new(new_comment_params)
      if @comment.save
        flash[:info] = "Le commentaire a bien été créé."
        redirect_to offers_path(current_user: @current_user, current_offer: @current_offer)
      else
        render :new
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_current_user
      @current_user = User.find(session[:user_id])
    end

    def set_current_offer
      @current_offer = Offer.find(params[:offer_id])
    end

  end
end

module Offers
  class CommentsController < ApplicationController
  before_action :set_current_offer, only: [:create]

    def create
      new_comment_params = comment_params.merge(user_id: current_user.id).merge(offer_id: @current_offer.id)
      @comment = Comment.new(new_comment_params)
      if @comment.save
        redirect_to offer_path(@current_offer.id), notice: t('.success_comment')
      else
        redirect_to offer_path(@current_offer.id), alert: t('.error_comment')
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:content)
    end

    def set_current_offer
      @current_offer = Offer.find(params[:offer_id])
    end

  end
end

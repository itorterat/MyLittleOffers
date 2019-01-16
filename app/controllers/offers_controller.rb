class OffersController < ApplicationController

  def index
    @users = User.all
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def create
    @comments = Comment.all
    @comment = Comment.new
    @offer = current_user.offers.new(offer_params)
    if @offer.save
      redirect_to offers_path, notice: t('.success_offer')
    else
      redirect_to offers_path, alert: t('.error_offer')
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @comments = Comment.all
    @comment = Comment.new
  end

  def edit

  end

  def update
    Offer.find(params[:id]).update(state: "published")
    redirect_to offers_path
  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit(:title, :content, :price)
  end

end

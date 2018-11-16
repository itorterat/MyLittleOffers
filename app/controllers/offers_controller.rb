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
    if @offer.save!
      flash[:info] = "L'annonce a bien été créée."
      redirect_to offers_path(current_user)
    else
      render :new
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

  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit(:title, :content, :price)
  end

end

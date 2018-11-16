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
      flash[:info] = "Offer has been created!"
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
    Offer.update(state: "published")
    redirect_to offers_path(current_user)
  end

  def destroy

  end

  private

  def offer_params
    params.require(:offer).permit(:title, :content, :price)
  end

end

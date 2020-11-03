class StickersController < ApplicationController
  def index
    @stickers = Sticker.all
  end

  def new
    @sticker = Sticker.new
  end

  def create
    @sticker = Sticker.new(sticker_params)
    if @sticker.save
       redirect_to stickers_path
    else
      render :new
    end
  end

  def destroy
    @sticker = Sticker.find(params[:id])
    @sticker.destroy
    redirect_to stickers_path
  end


  private
  def sticker_params
    params.require(:sticker).permit(:sticker_name)
  end
end

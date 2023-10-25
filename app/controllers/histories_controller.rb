class HistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @address_history = AddressHistory.new
  end

  def create
    @address_history = AddressHistory.new(history_params)
    if @address_history.valid?
      @address_history.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end
  end

  def history_params
    params.require(:address_history).permit(:post_code, :prefecture_id, :city, :address,:building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

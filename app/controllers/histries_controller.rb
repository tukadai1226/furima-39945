class HistriesController < ApplicationController
  def index
    @address_history = History.new
  end

  def create
    @address_history = History.new(history_params)
    if @address_history.valid?
      @address_history.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def history_params
    params.require(:address_history).permit(:post_code, :prefecture_id, :city, :address, :telephone).merge(user_id: current_user.id, item_id: item.id)
  end
end

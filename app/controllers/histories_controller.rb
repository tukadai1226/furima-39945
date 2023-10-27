class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, ]
  before_action :move_to_index, only: [:index, :create, :pay_item, :move_to_index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @address_history = AddressHistory.new
  end

  def create
    @address_history = AddressHistory.new(history_params)
    if @address_history.valid?
      pay_item
      @address_history.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.require(:address_history).permit(:post_code, :prefecture_id, :city, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: history_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.history != nil
    redirect_to items_path
    end
  end
end

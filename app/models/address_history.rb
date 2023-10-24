class AddressHistory

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :telephone, :history

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone
    validates :history
  end

  def save
    # 購入履歴情報を保存し、変数historyに代入する
    history = History.create(item_id: irem, user_id: user_id)
    # 住所を保存する
    ShoppingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, telephone: telephone, history_id: history.id)
end
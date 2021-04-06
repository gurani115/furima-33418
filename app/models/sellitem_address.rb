class SellitemAddress
  include ActiveModel::Model
  attr_accessor  :postal_code, :region_id, :town, :numbering, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :town
    validates :numbering
    validates :telephone, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end
    validates :region_id, presence: true, numericality: { other_than: 1 }
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, region_id: region_id, town: town, numbering: numbering, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end
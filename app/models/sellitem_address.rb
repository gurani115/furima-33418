class SellitemAddress
  include ActiveModel::Model
  attr_accessor  :postal_code, :region_id, :town, :numbering, :building, :telephone, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :town
    validates :numbering
    validates :telephone
    validates :token
  end
    validates :region_id, presence: true, numericality: { other_than: 1 }
  def save
    binding.pry
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, region_id: region_id, town: town, numbering: numbering, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end
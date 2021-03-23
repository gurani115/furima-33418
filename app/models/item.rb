class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery 
  belongs_to :region 
  belongs_to :day 

  with_options presence: true do
    validates :image
    validates :product_name
    validates :explanation
    validates :price
  end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id 
    validates :state_id
    validates :delivery_id
    validates :region_id
    validates :day_id
  end
  validates :price, inclusion: { in: 300..9999999 }
  validates :price, format: {with: /\A[0-9]+\z/}
end

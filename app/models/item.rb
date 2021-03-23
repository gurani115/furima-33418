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
    validates :category_id, numericality: { other_than: 1 } 
    validates :state_id, numericality: { other_than: 1 } 
    validates :delivery_id, numericality: { other_than: 1 } 
    validates :region_id, numericality: { other_than: 1 } 
    validates :day_id, numericality: { other_than: 1 } 
    validates :price
  end
  validates :price, inclusion: { in: 300..9999999 }
  validates :price, format: {with: /\A[0-9]+\z/}
end

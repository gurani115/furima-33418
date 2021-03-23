class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '新品・未使用'},
    { id: 3, name: '未使用に近い'}
  ]
  include ActiveHash::Associations
  has_many :items
end
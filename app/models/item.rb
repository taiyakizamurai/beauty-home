class Item < ApplicationRecord
    attachment :image
  belongs_to :trouble
  belongs_to :maker
  has_many :cart_items
  has_many :order_details

  validates :name, presence: true
  validates :image_id, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :is_active, presence: true



def self.search(keyword)
  where(["name like? OR introduction like?", "%#{keyword}%", "%#{keyword}%"])
end
end

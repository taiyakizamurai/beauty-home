class Maker < ApplicationRecord
  has_many :items
  attachment :image
  
  validates :name, presence: true
  validates :image_id, presence: true
  validates :introduction, presence: true
end

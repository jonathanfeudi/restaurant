class Item < ActiveRecord::Base
  has_many :tickets
  has_many :tables, through: :tickets

  validates :name, :price, :description, presence: true
  validates :price, numericality: true

end

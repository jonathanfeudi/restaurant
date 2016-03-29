class Table < ActiveRecord::Base
  belongs_to :user
  has_many :tickets
  has_many :items, through: :tickets

  validates :table_number, :guests, numericality: true, inclusion: {in: 1..30}
  validate :one_check_per_table

  def add_item(item)
    self.items << item
  end

  def remove_item(item)

  end

  def one_check_per_table
    if Table.where(table_number: (self[:table_number])).length > 0
      errors.add(:table_number, "Cannot open a check on tables currently in use")
    end
  end

end

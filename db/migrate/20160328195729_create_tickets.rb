class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :table
      t.references :item
      t.boolean :fired, :default => false
      t.boolean :completed, :default => false
    end
  end
end

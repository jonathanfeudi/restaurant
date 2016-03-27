class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :guests
      t.boolean :paid
      t.string :gossip
      t.references :user
      t.timestamps
    end
  end
end

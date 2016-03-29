class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :ingredients
      t.string :description
      t.references :tickets
    end
  end
end

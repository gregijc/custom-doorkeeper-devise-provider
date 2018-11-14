class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.date :release_date
      t.integer :price
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end

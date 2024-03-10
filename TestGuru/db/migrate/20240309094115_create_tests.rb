class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 1
      t.integer :category_id

      t.timestamps
    end
  end
end

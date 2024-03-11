class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 1
      t.references :category, foreign_key: true
      t.integer :author_id, null: false
      t.foreign_key :users, column: :author_id
      t.index :author_id

      t.timestamps
    end
  end
end

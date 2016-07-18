class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.references :book, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.date :start_point
      t.date :end_point
      t.float :price

      t.timestamps null: false
    end
  end
end

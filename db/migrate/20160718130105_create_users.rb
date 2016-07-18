class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :address_line1
      t.string :address_line2
      t.string :address_city
      t.string :address_country
      t.string :address_postcode

      t.timestamps null: false
    end
  end
end

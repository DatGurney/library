class AddFinesToLoans < ActiveRecord::Migration
  def change
  	change_table :loans do |t|
  		t.float :fine_amount
  		t.date :fine_paid_on
  	end	
  end
end

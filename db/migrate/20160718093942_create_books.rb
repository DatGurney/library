class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :author
    	t.string :isbn
    	t.string :name
    	t.string :publisher
    end
  end
end

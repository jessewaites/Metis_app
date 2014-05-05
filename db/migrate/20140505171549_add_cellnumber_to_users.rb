class AddCellnumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cell_number, :string
  end
end

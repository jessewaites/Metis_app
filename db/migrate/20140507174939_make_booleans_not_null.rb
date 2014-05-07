class MakeBooleansNotNull < ActiveRecord::Migration
  def change
    change_column_null(:users, :admin, false )
    change_column_null(:users, :purchased_book, false)
  end
end

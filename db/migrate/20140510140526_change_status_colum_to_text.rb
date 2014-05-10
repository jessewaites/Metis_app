class ChangeStatusColumToText < ActiveRecord::Migration
  def change
    rename_column :statuses, :status, :text
  end
end

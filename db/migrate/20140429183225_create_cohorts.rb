class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :year
      t.string :quarter

      t.timestamps
    end
  end
end

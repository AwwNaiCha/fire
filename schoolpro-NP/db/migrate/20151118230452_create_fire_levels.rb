class CreateFireLevels < ActiveRecord::Migration
  def change
    create_table :fire_levels do |t|
      t.string :park_name
      t.date :date
      t.string :level

      t.timestamps
    end
  end
end

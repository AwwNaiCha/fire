class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.string :park_name
      t.date :date
      t.float :temp
      t.float :precip
      t.float :wind
      t.float :humidity

      t.timestamps
    end
  end
end

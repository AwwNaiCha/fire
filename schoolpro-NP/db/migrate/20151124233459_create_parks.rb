class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :park_name
      t.string :state

      t.timestamps
    end
  end
end

class CreateMonthlyFireLevels < ActiveRecord::Migration
  def change
    create_table :monthly_fire_levels do |t|
      t.string :park_name
      t.integer :jan
      t.integer :feb
      t.integer :mar
      t.integer :apr
      t.integer :may
      t.integer :jun
      t.integer :jul
      t.integer :aug
      t.integer :sep
      t.integer :oct
      t.integer :nov
      t.integer :dec

      t.timestamps
    end
  end
end

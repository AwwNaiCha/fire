class CreateMonthlyPrcps < ActiveRecord::Migration
  def change
    create_table :monthly_prcps do |t|
      t.string :park_name
      t.float :jan
      t.float :feb
      t.float :mar
      t.float :apr
      t.float :may
      t.float :jun
      t.float :jul
      t.float :aug
      t.float :sep
      t.float :oct
      t.float :nov
      t.float :dec

      t.timestamps
    end
  end
end

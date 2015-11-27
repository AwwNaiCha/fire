class AddColumnNameToWeathers < ActiveRecord::Migration
  def change
    add_column :weathers, :fireLevel, :integer
  end
end

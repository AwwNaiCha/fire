class AddColumnToParks < ActiveRecord::Migration
  def change
    add_column :parks, :nation, :string
  end
end

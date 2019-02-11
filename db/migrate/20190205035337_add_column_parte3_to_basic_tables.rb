class AddColumnParte3ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte3, :string
  end
end

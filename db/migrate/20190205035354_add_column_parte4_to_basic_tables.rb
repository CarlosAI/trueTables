class AddColumnParte4ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte4, :string
  end
end

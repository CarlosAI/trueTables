class AddColumnParte1ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte1, :string
  end
end

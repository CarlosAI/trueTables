class AddColumnParte5ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte5, :string
  end
end

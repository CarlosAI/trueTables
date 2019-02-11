class AddColumnParte6ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte6, :string
  end
end

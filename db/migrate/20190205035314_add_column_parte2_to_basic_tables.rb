class AddColumnParte2ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :parte2, :string
  end
end

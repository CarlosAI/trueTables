class AddColumnResParte6ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte6, :boolean
  end
end

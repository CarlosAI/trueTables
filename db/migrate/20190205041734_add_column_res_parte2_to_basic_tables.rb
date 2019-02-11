class AddColumnResParte2ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte2, :boolean
  end
end

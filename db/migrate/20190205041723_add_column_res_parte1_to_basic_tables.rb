class AddColumnResParte1ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte1, :boolean
  end
end

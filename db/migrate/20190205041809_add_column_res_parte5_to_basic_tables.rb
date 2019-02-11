class AddColumnResParte5ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte5, :boolean
  end
end

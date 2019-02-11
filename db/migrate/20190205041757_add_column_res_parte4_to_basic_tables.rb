class AddColumnResParte4ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte4, :boolean
  end
end

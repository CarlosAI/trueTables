class AddColumnResParte3ToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :res_parte3, :boolean
  end
end

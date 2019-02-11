class AddColumnExpresionToBasicTables < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_tables, :expresion, :string
  end
end

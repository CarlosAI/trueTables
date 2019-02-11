class CreateBasicTables < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_tables do |t|
      t.boolean :p
      t.boolean :q
      t.boolean :r
      t.boolean :s
      t.integer :tipo

      t.timestamps
    end
  end
end

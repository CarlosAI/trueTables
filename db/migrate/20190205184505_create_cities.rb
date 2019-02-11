class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :nombre
      t.integer :poblacion
      t.string :pais

      t.timestamps
    end
  end
end

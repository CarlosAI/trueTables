class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :nombre
      t.string :modelo
      t.integer :anho

      t.timestamps
    end
  end
end

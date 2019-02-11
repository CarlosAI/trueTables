class AddColumnNombreEmpleadoToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :employees, :nombre_empleado, :string
  end
end

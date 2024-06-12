class AddBirthdateToEmployees < ActiveRecord::Migration[7.1]
  def up
    add_column :employees, :birthdate, :date
  end
  
  def down
    remove_column :employees, :birthdate
  end
end

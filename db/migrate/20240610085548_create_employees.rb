class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :position
      t.integer :phoneno

      t.timestamps
    end
  end
end

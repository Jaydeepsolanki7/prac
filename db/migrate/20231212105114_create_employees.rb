class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id

      t.timestamps
    end
  end
end

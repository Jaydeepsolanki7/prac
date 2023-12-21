class CreateEmailHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :email_histories do |t|
      t.references :post, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end

class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.references :user
      t.references :book

      t.timestamps
    end
  end
end

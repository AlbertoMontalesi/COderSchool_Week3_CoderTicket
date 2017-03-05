class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :ticket_type_id
      t.integer :quantity
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.decimal :total

      t.timestamps
    end
  end
end

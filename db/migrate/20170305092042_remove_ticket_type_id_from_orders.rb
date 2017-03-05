class RemoveTicketTypeIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :ticket_type_id, :integer
  end
end

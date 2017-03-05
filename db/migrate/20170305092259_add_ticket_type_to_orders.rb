class AddTicketTypeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :ticket_type, foreign_key: true
  end
end

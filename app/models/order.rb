class Order < ApplicationRecord

    belongs_to :ticket_type
    validates :name, :phone, :address, presence: true
    validates :quantity, presence: true

    def quantity_remaining
        ticket_type.max_quantity -= Order.quantity
        ticket_type.save
    end

    def ticket_type_price
        ticket_type.price unless nil
    end

    def total_price_calculation
        self.total = ticket_type_price * self.quantity
    end
end

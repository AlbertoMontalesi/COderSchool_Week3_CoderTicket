require 'rails_helper'

RSpec.describe Order, type: :model do

  it 'is not valid when quantity is more than 10'do
    testorder = Order.new(quantity: 15)
    expect(testorder).to_not be_valid
    end
end

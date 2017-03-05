require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'is not valid when password is blank'do
    testuser = User.new(password:"")
    expect(testuser).to_not be_valid
    end
end

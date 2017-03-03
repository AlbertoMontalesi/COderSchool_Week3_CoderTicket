require 'rails_helper'


RSpec.describe "routing to sign_up", :type => :routing do
  it "routes /sign_up to users#new" do
    expect(:get => "/sign_up").to route_to(
      :controller => "users",
      :action => "new"
    )
  end
end
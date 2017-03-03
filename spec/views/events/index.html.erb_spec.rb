require 'rails_helper'

RSpec.describe "events/index", type: :view do
  it "renders Discover upcoming events in a header tag" do
    assign(:events, [])
    render
    expect(rendered).to include("<h2>Discover upcoming messages </h2>")
  end

end

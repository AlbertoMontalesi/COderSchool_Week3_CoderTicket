require 'rails_helper'

RSpec.describe "events/new", type: :view do
  it "renders sign in when unlogged user tries to create an event" do
    assign(:user,[])
    render
    expect(rendered).to redirect_to(new_session_path)
  end

end
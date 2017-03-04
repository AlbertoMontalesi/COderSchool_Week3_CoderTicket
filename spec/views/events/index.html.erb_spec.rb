require 'rails_helper'
#gives error ActionView::Template::Error:
       #undefined method `each' for nil:NilClass

RSpec.describe "root_path", type: :view do
  it "renders Discover upcoming events in a header tag" do
     render :template => "events/index.html.erb"
    expect(rendered).to include("<h2>Discover upcoming messages </h2>")
  end

end

require 'rails_helper'

RSpec.describe "booths/index", type: :view do
  before(:each) do
    assign(:booths, [
      Booth.create!(
        :event => nil,
        :name => "Name",
        :sponser => "Sponser"
      ),
      Booth.create!(
        :event => nil,
        :name => "Name",
        :sponser => "Sponser"
      )
    ])
  end

  it "renders a list of booths" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sponser".to_s, :count => 2
  end
end

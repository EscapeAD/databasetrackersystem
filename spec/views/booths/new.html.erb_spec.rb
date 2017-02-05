require 'rails_helper'

RSpec.describe "booths/new", type: :view do
  before(:each) do
    assign(:booth, Booth.new(
      :event => nil,
      :name => "MyString",
      :sponser => "MyString"
    ))
  end

  it "renders new booth form" do
    render

    assert_select "form[action=?][method=?]", booths_path, "post" do

      assert_select "input#booth_event_id[name=?]", "booth[event_id]"

      assert_select "input#booth_name[name=?]", "booth[name]"

      assert_select "input#booth_sponser[name=?]", "booth[sponser]"
    end
  end
end

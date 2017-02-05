require 'rails_helper'

RSpec.describe "booths/edit", type: :view do
  before(:each) do
    @booth = assign(:booth, Booth.create!(
      :event => nil,
      :name => "MyString",
      :sponser => "MyString"
    ))
  end

  it "renders the edit booth form" do
    render

    assert_select "form[action=?][method=?]", booth_path(@booth), "post" do

      assert_select "input#booth_event_id[name=?]", "booth[event_id]"

      assert_select "input#booth_name[name=?]", "booth[name]"

      assert_select "input#booth_sponser[name=?]", "booth[sponser]"
    end
  end
end

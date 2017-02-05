require 'rails_helper'

RSpec.describe "booths/show", type: :view do
  before(:each) do
    @booth = assign(:booth, Booth.create!(
      :event => nil,
      :name => "Name",
      :sponser => "Sponser"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Sponser/)
  end
end

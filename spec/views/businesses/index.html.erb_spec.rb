require 'rails_helper'

RSpec.describe "businesses/index", :type => :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :name => "Name",
        :latlon => ""
      ),
      Business.create!(
        :name => "Name",
        :latlon => ""
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

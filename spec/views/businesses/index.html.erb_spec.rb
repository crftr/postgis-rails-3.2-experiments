require 'rails_helper'

RSpec.describe "businesses/index", :type => :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :name => "Pizza Hut",
        :latlong => ""
      ),
      Business.create!(
        :name => "Pizza Hut",
        :latlong => ""
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => "Pizza Hut".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end

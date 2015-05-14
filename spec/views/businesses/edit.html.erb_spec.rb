require 'rails_helper'

RSpec.describe "businesses/edit", :type => :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :name => "MyString",
      :latlon => ""
    ))
  end

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input#business_name[name=?]", "business[name]"

      assert_select "input#business_latlon[name=?]", "business[latlon]"
    end
  end
end

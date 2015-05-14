require 'rails_helper'

RSpec.describe "businesses/new", :type => :view do
  before(:each) do
    assign(:business, Business.new(
      :name => "MyString",
      :latlon => ""
    ))
  end

  it "renders new business form" do
    render

    assert_select "form[action=?][method=?]", businesses_path, "post" do

      assert_select "input#business_name[name=?]", "business[name]"

      assert_select "input#business_latlon[name=?]", "business[latlon]"
    end
  end
end

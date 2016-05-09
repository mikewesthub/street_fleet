require 'rails_helper'

RSpec.describe "trucks/index", type: :view do
  before(:each) do
    assign(:trucks, [
      Truck.create!(
        :name => "Name",
        :twitter => "Twitter",
        :email => "Email",
        :phone_1 => "Phone 1",
        :phone_2 => "Phone 2",
        :website => "Website"
      ),
      Truck.create!(
        :name => "Name",
        :twitter => "Twitter",
        :email => "Email",
        :phone_1 => "Phone 1",
        :phone_2 => "Phone 2",
        :website => "Website"
      )
    ])
  end

  it "renders a list of trucks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Twitter".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone 1".to_s, :count => 2
    assert_select "tr>td", :text => "Phone 2".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
  end
end
